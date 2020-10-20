import Foundation

/**
 Describes the methods for receiving data using Twitter API.
 */
struct TwitterDataSource {
    // swiftlint:disable line_length
    /**
     Network service that we use to make requests to the Twitter API.
     */
    private let networkService: NetworkService = NetworkService(networkConfiguration: Settings.shared.activeNetworkConfiguration)
    // swiftlint:enable line_length

    /**
     Receives a collection of tweets posted by the authenticated user
     and the users he is following.

     Tweet collection is based on the interval formed by the
     `firstTweet` and/or `lastTweet` parameters. If the
     interval is implicit (both `firstTweet` and `lastTweet`
     parameters are `nil`), then only the latest tweets from the
     timeline are received.

     Up to 20 tweets can be received in each case.

     - Parameters:
       - firstTweet: A tweet that defines the start of the
       interval in the timeline. The result collection contains tweets
       starting this one (but not including).
       - lastTweet: A tweet that defines the end of the interval
       in the timeline. The result collection contains tweets ending
       this one (including).
       - completion: A completion handler that is called upon
       getting the tweets. Takes the array of `Tweet` objects. If an
       error occurred while receiving tweets, the array is empty.
     */
    public func getHomeTimeline(since firstTweet: Tweet?,
                                until lastTweet: Tweet?,
                                completion: @escaping ([Tweet]) -> Void) {
        var queryParameters = HTTPQueryParameters()
        queryParameters["since_id"] = firstTweet?.idString
        queryParameters["max_id"] = lastTweet?.idString

        let apiEndpoint = APIEndpoints.getHomeTimeline(with: [:], queryParameters: queryParameters)

        networkService.httpRequest(apiEndpoint: apiEndpoint) { result in
            switch result {
            case .failure:
                completion([])
            case let .success(data):
                if let tweetsArray = try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data) {
                    completion(tweetsArray)
                } else {
                    completion([])
                }
            }
        }
    }

    /**
     Gets an authenticated user.
     - Parameter completion: A completion handler that
     takes `User` object corresponding to the current authenticated
     user as a parameter, or `nil` if the authenticated user was
     not received.
     */
    public func getAuthenticatedUser(completion: @escaping (User?) -> Void) {
        let apiEndpoint = APIEndpoints.getAuthenticatedUser(with: [:])

        networkService.httpRequest(apiEndpoint: apiEndpoint) { result in
            switch result {
            case .failure:
                completion(nil)
            case let .success(data):
                if let userArray = try? JSONDecoder().decodeTwitterResponse([User].self, from: data),
                    let user = userArray.first {
                    completion(user)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
