import Foundation

/**
 The configuration allows to make network requests.
 */
struct RemoteNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = URL(string: "https://api.twitter.com/")!
    var commonHeaders: HTTPHeaders = [:]
}
