//
//  FFSharepoint.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFSharepoint {
    
    public var agency: FFAgency!
    public var repository: FFRepository!
    
    private static var instance: FFSharepoint?
    
    public required init() {
        
    }
    
    public static func getInstance() -> FFSharepoint {
        
        guard instance != nil else {
            
            instance = FFSharepoint()
            
            instance!.agency = FFAgency()
            instance!.agency!.manager = FFManager()
            instance!.agency!.manager!.apiManager = FFApiManager()
            instance!.agency!.manager!.eventManager = FFEventManager()
            instance!.agency!.manager!.networkManager = FFNetworkManager()
            instance!.agency!.manager!.mediaManager = FFMediaManager()
            instance!.agency!.provider = FFProvider()
            instance!.agency!.provider!.colorProvider = FFColorProvider()
            instance!.agency!.provider!.fontProvider = FFFontProvider()
            instance!.agency!.provider!.imageProvider = FFImageProvider()
            
            instance!.repository = FFRepository()
            instance!.repository!.dataStorage = FFDataStorage()
            instance!.repository!.exchangeFlow = FFExchangeFlow()
            instance!.repository!.persistentStorage = FFPersistentStorage()
            instance!.repository!.stateMachine = FFStateMachine()
            
            instance!.agency!.manager!.apiManager!.injectDependencies()
            instance!.agency!.manager!.networkManager!.injectDependencies()
            
            return instance!
            
        }
        
        return instance!
        
    }
    
    public static func resetSharepoint() {
        instance = nil
        
    }
    
    
}
