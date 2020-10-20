import UIKit

class AuthorizationViewController: UIViewController {
    /**
     Calls after touch of the Log in button for using a mock for User's sing in
     and then presenting the ListOfTweets screen.
     */
    @IBAction func redirectToTwitterLoginPage(_: UIButton) {
//        let queue = DispatchQueue.global(qos: .userInitiated)
//        queue.async {}

        Authentication.signIn { isSignedIn in
            if isSignedIn, let viewController = AppStoryboard.listOfTweets.viewController(of:
                ListOfTweetsViewController.self) {
                DispatchQueue.main.async {
                    viewController.modalPresentationStyle = .overCurrentContext
                    self.present(viewController, animated: true, completion: nil)
                }
            }
        }
    }
}
