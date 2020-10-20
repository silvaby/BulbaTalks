import UIKit

/**
 Contains properties of the class `UIImageView` that
 can be rendered in the Interface Builder.
 */
@IBDesignable
class RoundedImageView: UIImageView {
    /**
     Defines the radius to use when drawing
     rounded corners of `UIImageView`.
     */
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
