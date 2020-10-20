import UIKit

extension UIButton {
    /**
     Parameters for button animation.
     */
    private enum AnimationParameter {
        /**
         Shows how long will be last animation of resize
         the button (from big size to small or return size
         from small to big) after touch
         */
        static let scaleChangingDuration = 0.1

        /**
         Shows how to change the scale (x and y)
         of the button by the animation after touch.
         */
        static let scaleTransformation: CGFloat = 0.95
    }

    /**
     The animation after touch of the button which changes
     a scale (x and y) of the button for some duration and
     then return original scale back.
     */
    func touchAnimation() {
        UIButton.animate(withDuration: AnimationParameter.scaleChangingDuration,
                         animations: scaleTransform,
                         completion: animationTransformToOriginalScale)
    }

    private var animationTransformToOriginalScale: (Bool) -> Void { { _ in
        let halfAnimationDuration = AnimationParameter.scaleChangingDuration
        UIButton.animate(withDuration: halfAnimationDuration,
                         animations: {
                             self.transform = CGAffineTransform.identity
         })
    } }

    private func scaleTransform() {
        transform = CGAffineTransform(
            scaleX: AnimationParameter.scaleTransformation,
            y: AnimationParameter.scaleTransformation
        )
    }
}
