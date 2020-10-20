import Foundation

/**
 Represents a request that depends on HTTP protocol and can be
 asynchronously executed.
 */
protocol HTTPRequestable {
    /**
     HTTP method to indicate the desired action to be performed
     on the specified resource.
     */
    var method: HTTPMethodType { get }

    /**
     Relative part of the absolute resource URL.
     */
    var path: String { get }

    /**
     Parameters that form headers in the HTTP request.
     */
    var headerParameters: HTTPHeaderParameters { get }

    /**
     Parameters that form a query string in the URL.
     */
    var queryParameters: HTTPQueryParameters { get }

    /**
     Parameters that form a body in the HTTP request.
     */
    var bodyParameters: HTTPBodyParameters { get }

    /**
     Creates the `URLRequest`, using the specific network
     configuration.
     - Parameter config: A network configuration to use to
     construct the request.
     - Returns: A new 'URLRequest', or `nil` if it's impossible
     to construct a request.
     */
    func urlRequest(using config: NetworkConfiguration) -> URLRequest?
}

extension HTTPRequestable {
    public func urlRequest(using config: NetworkConfiguration) -> URLRequest? {
        guard let url = url(using: config) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue

        var allHeaders: HTTPHeaders = config.commonHeaders
        headerParameters.forEach { allHeaders.updateValue($1, forKey: $0) }
        urlRequest.allHTTPHeaderFields = allHeaders

        if !bodyParameters.isEmpty {
            let bodyString = bodyParameters
                .map { "\($0.key)=\($0.value)" }
                .joined(separator: "&")
                .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""

            urlRequest.httpBody = bodyString.data(using: String.Encoding.ascii, allowLossyConversion: true)
        }

        return urlRequest
    }

    /**
     Creates URL, using the specific network configuration and
     the `path`.
     - Parameter config: A network configuration to use to
     construct the URL.
     - Returns: A new 'URL', or `nil` if it's impossible to
     construct a URL.
     */
    private func url(using config: NetworkConfiguration) -> URL? {
        let endpointURLString = config.baseURL.absoluteString.appending(path)

        guard var urlComponents = URLComponents(string: endpointURLString) else {
            return nil
        }

        var allURLQueryItems = [URLQueryItem]()
        queryParameters.forEach {
            let queryItem = URLQueryItem(name: $0.key, value: $0.value)
            allURLQueryItems.append(queryItem)
        }

        urlComponents.queryItems = !allURLQueryItems.isEmpty ? allURLQueryItems : nil
        return urlComponents.url
    }
}
