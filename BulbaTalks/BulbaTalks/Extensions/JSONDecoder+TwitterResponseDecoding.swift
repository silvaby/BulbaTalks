import Foundation

protocol TwitterResponseDecoding {
    func decodeTwitterResponse<T>(_ type: T.Type,
                                  from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: TwitterResponseDecoding {
    func decodeTwitterResponse<T>(_ type: T.Type,
                                  from data: Data) throws -> T where T: Decodable {
        let oldDateDecodingStrategy = dateDecodingStrategy
        defer { self.dateDecodingStrategy = oldDateDecodingStrategy }

        do {
            dateDecodingStrategy = .formatted(.twitter)
            return try decode(type, from: data)
        } catch {
            throw error
        }
    }
}
