/**
 Describes network error.
 */
enum NetworkError: Error {
    /**
     HTTP response with the non-successful status
     code is received (outside the 2xx codes).
     The status codes described in the RFC7231.
     */
    case badResponse(statusCode: Int)
    /**
     The request can't be completed due to the reason
     specified in the `description`.
     */
    case failedRequest(description: String)
    /**
     The response does not conform to HTTP protocol or
     it is corrupted.
     */
    case nonHTTPResponse
    /**
     The URL from the request can't be used to make
     a network call.
     */
    case invalidURL
    /**
     The HTTP request can't be used to make a network call.
     */
    case invalidURLRequest
    /**
     No data is in the received response or the data is
     malformed.
     */
    case noData
}
