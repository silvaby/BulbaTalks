import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _:
        [UIApplication.LaunchOptionsKey: Any]? = nil)
        -> Bool {
        var viewController: UIViewController?
        if Authentication.isSignedIn {
            viewController = AppStoryboard.listOfTweets.viewController(of:
                ListOfTweetsViewController.self)
        } else {
            viewController = AppStoryboard.authorization.viewController(of:
                AuthorizationViewController.self)
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
