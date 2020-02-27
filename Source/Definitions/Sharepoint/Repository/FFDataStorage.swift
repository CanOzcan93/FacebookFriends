//
//  FFDataStorage.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
import RealmSwift

open class FFDataStorage {
    
    public required init() {
        
    }
    
    private var database: Realm?
    public func getDatabase() -> Realm? {
        
        if let db = database {
            return db
        }
        else {
            do {
                try database = Realm()
                print(Realm.Configuration.defaultConfiguration.fileURL)
                return database!
            } catch {
                print("Error About Realm")
                return nil
            }
        }
        
    }
    
    private var user: User?
    public func storeUser(user: User?) {
        self.user = user
    }
    public func grabUser() -> User? {
        return self.user
    }
    
    
}
