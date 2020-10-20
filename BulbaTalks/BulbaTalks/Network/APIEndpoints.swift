/**
 API endpoints for interacting with the Twitter API.
 */
struct APIEndpoints {
    /**
     Constructs the HTTP endpoint to get
     a collection of tweets from the timeline.
     - Parameters:
        - headerParameters: Parameters that form
        headers in the HTTP request.
        - queryParameters: Parameters that form
        a query string in the URL.
     - Returns: The object describing API HTTP
     endpoint to get a timeline of tweets.
     */
    static func getHomeTimeline(with headerParameters: HTTPHeaderParameters,
                                queryParameters: HTTPQueryParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/statuses/home_timeline.json",
                            headerParameters: headerParameters,
                            queryParameters: queryParameters,
                            bodyParameters: [:])
    }

    /**
     Constructs the HTTP endpoint to get user
     authentication information.
     - Parameter headerParameters: Parameters that form
     headers in the HTTP request.
     - Returns: The object describing API HTTP
     endpoint to get information about an authenticated user.
     */
    static func getAuthenticatedUser(with headerParameters: HTTPHeaderParameters) -> HTTPRequestable {
        return HTTPEndpoint(method: .get,
                            path: "1.1/account/verify_credentials.json",
                            headerParameters: headerParameters,
                            queryParameters: [:],
                            bodyParameters: [:])
    }
}
