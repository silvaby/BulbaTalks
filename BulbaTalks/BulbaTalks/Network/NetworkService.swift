import Foundation
/**
 Provides interaction with the network.
 */
class NetworkService {
    /**
     The active network configuration.
     */
    private var activeNetworkConfiguration: NetworkConfiguration

    /**
     Creates a `NetworkService` object with the specified
     network configuration.
     */
    init(networkConfiguration: NetworkConfiguration) {
        activeNetworkConfiguration = networkConfiguration
    }

    /**
     Makes a network request and calls the handler upon
     request's completion.
     - Parameters:
       - request: The `URLRequest` that represents
       information about the request.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       the details about the network error.
     */
    private func networkRequest(request: URLRequest,
                                completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let networkTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.failedRequest(description: error.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.nonHTTPResponse))
                return
            }
            guard (200 ... 299).contains(httpResponse.statusCode) else {
                completion(.failure(.badResponse(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        networkTask.resume()
    }

    /**
     Makes a mock request and calls the handler upon
     request's completion.
     - Parameters:
       - request: The `URLRequest` that represents
       information about the request.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       the details about the network error.
     */
    private func mockRequest(request: URLRequest,
                             completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let mockedURL = request.url else {
            completion(.failure(.invalidURL))
            return
        }

        DispatchQueue.global().async {
            if let data = Bundle.main.contentsOfFile(at: mockedURL) {
                completion(.success(data))
            } else {
                completion(.failure(.noData))
            }
        }
    }
}

extension NetworkService: HTTPNetworking {
    /**
     Performs network or mock requests depending
     on the active network configuration.
     - Parameters:
       - apiEndpoint: API HTTP endpoint.
       - completion: The completion handler that accepts
       `Result` as a parameter, where the success case
       will get requested data and the failure case will get
       the details about the network error.
     */
    public func httpRequest(apiEndpoint: HTTPRequestable,
                            completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let urlRequest = apiEndpoint.urlRequest(using: activeNetworkConfiguration) else {
            completion(.failure(.invalidURLRequest))
            return
        }
        if activeNetworkConfiguration is RemoteNetworkConfiguration {
            networkRequest(request: urlRequest, completion: completion)
        } else {
            mockRequest(request: urlRequest, completion: completion)
        }
    }
}
