import Foundation

/**
 Settings common to the network configuration.
 For example, the network configuration can force using
 the mock network API.
 Stores current base URL and headers
 common to all network requests.
 */
protocol NetworkConfiguration {
    /**
     The part of the absolute URL which is followed by
     the relative endpoint URL.
     */
    var baseURL: URL { get }
    /**
     Specifies common headers that are added to all tasks
     within sessions based on the network configuration.
     */
    var commonHeaders: HTTPHeaders { get }
}
