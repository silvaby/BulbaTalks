import Foundation

protocol TwitterObjectEncoding {
    func encodeTwitterObject<T>(_ value: T) throws -> Data where T: Encodable
}

extension JSONEncoder: TwitterObjectEncoding {
    func encodeTwitterObject<T>(_ value: T) throws -> Data where T: Encodable {
        let oldDateDecodingStrategy = dateEncodingStrategy
        defer { self.dateEncodingStrategy = oldDateDecodingStrategy }

        do {
            dateEncodingStrategy = .formatted(.twitter)
            return try encode(value)
        } catch {
            throw error
        }
    }
}
