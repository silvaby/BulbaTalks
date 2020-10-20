/**
 Defines an HTTP endpoint.
 */
struct HTTPEndpoint: HTTPRequestable {
    let method: HTTPMethodType
    let path: String
    let headerParameters: HTTPHeaderParameters
    let queryParameters: HTTPQueryParameters
    let bodyParameters: HTTPBodyParameters
}
