import Foundation

/**
 The configuration allows to mock network requests.
 */
struct MockNetworkConfiguration: NetworkConfiguration {
    var baseURL: URL = Bundle.main.bundleURL
    var commonHeaders: HTTPHeaders = [:]
}
