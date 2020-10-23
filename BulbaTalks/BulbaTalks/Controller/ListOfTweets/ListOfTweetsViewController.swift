import UIKit

class ListOfTweetsViewController: UIViewController {
    // MARK: - Properties

    /**
     An authenticated user, or `nil` if the authenticated user was
     not received.
     */
    var user: User?

    // MARK: - IBOutlet

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var signOut: UISwitch!

    // MARK: - Instance Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure table view
        tableView.registerCell(of: ListOfTweetsTableViewCell.self)

        // Configure tab bar
        tabBar.barTintColor = .white

        // Add twitter logi in the navigation bar
        if let logoOfTwitter = UIImage(named: "logoOfTwitter") {
            let twitterLogoImageView = UIImageView(image: logoOfTwitter)
            twitterLogoImageView.contentMode = .scaleAspectFit
            navigationItem.titleView = twitterLogoImageView
        }

        // Configure button on the left of navigation bar
        let barButtonFrame = CGRect(x: 0, y: 0,
                                    width: Constants.BarButtonItem.width,
                                    height: Constants.BarButtonItem.height)
        let button = UIButton(frame: barButtonFrame)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = button.frame.height / 2
        button.widthAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Anchor.width).isActive = true
        button.heightAnchor.constraint(equalToConstant:
            Constants.BarButtonItem.Anchor.height).isActive = true
        button.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        navigationBar.items = [navigationItem]

        // Get an authenticated user and show his image
        // on the navigation bar
        TwitterDataSource().getAuthenticatedUser { user in
            if let user = user {
                self.user = user
                Bundle.main.getImage(at: URL(fileURLWithPath: user.profileImageURLString)) { image in
                    DispatchQueue.main.async {
                        button.setImage(image, for: .normal)
                    }
                }
            }
        }

        // Configure switch
        signOut.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
        Authentication.isSignedIn ? signOut.setOn(true, animated: true) :
            signOut.setOn(false, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            tabBar.frame.size.height = Constants.TabBar.heightInLandscapeOrientation
            tabBar.frame.origin.y = view.frame.height - Constants.TabBar.heightInLandscapeOrientation
        }
    }

    // MARK: - IBAction

    /// Opens the profile of the authenticated user.
    @objc func openProfile(_: UIBarButtonItem) {}

    /// Gets a view controller to create a new Tweet.
    @IBAction func composeTweet(_: UIButton) {}

    /// Changes the state of the authentication process (sign in/sign out).
    @objc func stateChanged(switchState: UISwitch) {
        switchState.isOn ? Authentication.signIn { _ in } : Authentication.signOut { _ in }
    }
}

// MARK: - Extensions

extension ListOfTweetsViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(of: ListOfTweetsTableViewCell.self) else {
            return UITableViewCell()
        }

        return cell
    }
}
