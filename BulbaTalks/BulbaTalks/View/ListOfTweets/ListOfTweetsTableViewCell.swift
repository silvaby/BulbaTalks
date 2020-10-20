import UIKit

class ListOfTweetsTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userIdenticalNameLabel: UILabel!
    @IBOutlet var tweetCreatedAtLabel: UILabel!
    @IBOutlet var tweetContentLabel: UILabel!
    @IBOutlet var tweetURLLabel: UILabel!
    @IBOutlet var tweetMediaImageView: RoundedImageView!
    @IBOutlet var numberOfCommentsLabel: UILabel!
    @IBOutlet var numberOfRetweetsLabel: UILabel!
    @IBOutlet var numberOfFavouritesLabel: UILabel!

    // MARK: - IBAction

    /// Opens the profile of the user.
    @IBAction func openProfile(_: UIButton) {}

    /// Leaves a comment under a tweet .
    @IBAction func commentTweet(_: UIButton) {}

    /**
     Shares a tweet publicly with followers
     of the currently authenticated user.
     */
    @IBAction func retweet(_: UIButton) {}

    /// Favorites/unfavorites a tweet.
    @IBAction func favoriteTweet(_: UIButton) {}
}
