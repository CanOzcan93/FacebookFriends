//
//  FFExchangeFlow.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class FFExchangeFlow {
    
    public required init() {
        
    }
    
    private var username: String?
    public func letUsername(username: String) {
        self.username = username
    }
    public func grabUsername() -> String? {
        return self.username
    }
    
    private var selectedFriend: Friend?
    public func letSelectedFriend(friend: Friend) {
        self.selectedFriend = friend
    }
    public func grabSelectedFriend() -> Friend? {
        return self.selectedFriend
    }
    
}
