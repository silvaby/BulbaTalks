import UIKit

extension UITableViewCell {
    /**
     A string used to identify a cell that is reusable.
     */
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
