//
//  Friend.swift
//  FacebookFriends
//
//  Created by Can Özcan on 27.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import RealmSwift

public class Friend: Object, Codable {
    @objc public dynamic var id : String = ""
    @objc public dynamic var isActive: Bool = false
    @objc public dynamic var age: Int = 0
    @objc public dynamic var eyeColor: String = ""
    @objc public dynamic var name: String = ""
    @objc public dynamic var gender: String = ""
    @objc public dynamic var company: String = ""
    @objc public dynamic var email: String = ""
    @objc public dynamic var phone: String = ""
    @objc public dynamic var address: String = ""
    @objc public dynamic var about: String = ""
    @objc public dynamic var registered: String = ""
    @objc public dynamic var latitude: Double = 0
    @objc public dynamic var longitude: Double = 0
    private var home: Dictionary<String,Double> = Dictionary<String,Double>()
    public var favoriteList = List<Favorite>()

    private enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case age
        case eyeColor
        case name
        case gender
        case company
        case email
        case phone
        case address
        case about
        case registered
        case home
        // Set JSON Object Key
        case favoriteList = "favorite_friends"

    }

    override public class func primaryKey() -> String? {
        return "id"
    }

    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.age = try container.decode(Int.self, forKey: .age)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.name = try container.decode(String.self, forKey: .name)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(String.self, forKey: .registered)
        self.home = try container.decode(Dictionary<String,Double>.self, forKey: .home)
        self.latitude = home["latitude"]!
        self.longitude = home["longitude"]!
        // Map your JSON Array response
        let favorites = try container.decodeIfPresent([Favorite].self, forKey: .favoriteList) ?? []
        favoriteList.append(objectsIn: favorites)
    }
}
