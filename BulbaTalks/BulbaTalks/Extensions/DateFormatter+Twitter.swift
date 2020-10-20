import Foundation

extension DateFormatter {
    static let twitter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        return formatter
    }()
}
