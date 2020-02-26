//
//  FFRepository.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFRepository {
    
    public var exchangeFlow: FFExchangeFlow!
    public var persistentStorage: FFPersistentStorage!
    public var stateMachine: FFStateMachine!
    public var dataStorage: FFDataStorage!
    
    public required init() {
        
    }
    
}
