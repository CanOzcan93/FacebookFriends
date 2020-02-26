//
//  FFManager.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFManager {
    
    public var apiManager: FFApiManager?
    public var eventManager: FFEventManager?
    public var networkManager: FFNetworkManager?
    public var mediaManager: FFMediaManager?
    
    public required init() {
        
    }
    
}
