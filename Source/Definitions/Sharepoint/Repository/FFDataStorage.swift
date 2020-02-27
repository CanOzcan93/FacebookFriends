//
//  FFDataStorage.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFDataStorage {
    
    public required init() {
        
    }
    
    private var user: User?
    public func storeUser(user: User?) {
        self.user = user
    }
    public func grabUser() -> User? {
        return self.user
    }
    
    
}
