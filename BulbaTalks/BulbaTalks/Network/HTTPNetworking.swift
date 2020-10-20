import Foundation
/**
 Defines methods and properties for interacting with a network
 using HTTP requests.
 */
protocol HTTPNetworking {
    /**
     Performs network request to receive data using the API.
     - Parameters:
        - apiEndpoint: API HTTP endpoint.
        - completion: The completion handler where the success
     case will get requested data and the failure case will
     get some `NetworkError`.
     */
    func httpRequest(apiEndpoint: HTTPRequestable,
                     completion: @escaping (Result<Data, NetworkError>) -> Void)
}
