import UIKit

/**
 Contains properties of the class `UIButton` that
 will render in Interface Builder in real-time.
 */
@IBDesignable
class ImageButton: UIButton {
    /**
     Defines the radius to use when drawing
     rounded corners of `UIButton`.
     */
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    /**
     A boolean indicating whether sublayers of the view are clipped to the bounds.
     When the value of this property is `true`, any sublayers of the view
     that extend outside its boundaries will be clipped to those boundaries.
     When the value of this property is `false`, no clipping occurs.
     */
    @IBInspectable var masksToBounds: Bool = false {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
}
