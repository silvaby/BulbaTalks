import Foundation

struct User: Codable {
    let id: Int
    let idString: String
    let name: String
    let screenName: String
    let description: String
    let followersCount: Int
    let friendsCount: Int
    let createdAt: Date
    let profileImageURLString: String
    let isProfileContainsDefaultBackground: Bool
    let isProfileContainsDefaultImage: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case idString = "id_str"
        case name
        case screenName = "screen_name"
        case description
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case createdAt = "created_at"
        case profileImageURLString = "profile_image_url_https"
        case isProfileContainsDefaultBackground = "default_profile"
        case isProfileContainsDefaultImage = "default_profile_image"
    }
}
