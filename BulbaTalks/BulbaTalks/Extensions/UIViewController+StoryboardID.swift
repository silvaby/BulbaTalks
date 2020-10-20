import UIKit

extension UIViewController {
    /**
     identifies the view controller in the storyboard file.
     */
    static var storyboardID: String {
        return "\(self)ID"
    }
}
