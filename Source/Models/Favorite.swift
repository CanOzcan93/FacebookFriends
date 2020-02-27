//
//  Favorite.swift
//  FacebookFriends
//
//  Created by Can Özcan on 27.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import RealmSwift

public class Favorite: Object, Codable {
    @objc public dynamic var id : String = ""
    @objc public dynamic var name: String = ""
    
    override public class func primaryKey() -> String? {
        return "id"
    }
}
