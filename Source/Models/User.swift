//
//  User.swift
//  FacebookFriends
//
//  Created by Can Özcan on 27.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import RealmSwift

public class User: Object, Codable {
    @objc public dynamic var username : String = ""
    public var friendList = List<Friend>()
    
    private enum CodingKeys: String, CodingKey {
        case username
        case friendList = "friends"
    }
    
    override public class func primaryKey() -> String? {
        return "username"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decode(String.self, forKey: .username)
        let friends = try container.decodeIfPresent([Friend].self, forKey: .friendList) ?? []
        friendList.append(objectsIn: friends)
    }
}
