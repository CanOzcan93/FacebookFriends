//
//  FFNetworkManager.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFNetworkManager: NSObject {
    
    /*
    -
    -
    // MARK: Sharepoint
    -
    -
    */
    
    private var sharepoint: FFSharepoint!
    
    private var agency: FFAgency!
    private var repository: FFRepository!
    
    private var manager: FFManager!
    
    private var eventManager: FFEventManager!
    private var networkManager: FFNetworkManager!
    
    private var dataStorage: FFDataStorage!
    private var persistentStorage: FFPersistentStorage!
    private var exchangeFlow: FFExchangeFlow!
    private var stateMachine: FFStateMachine!
    
    public func injectDependencies() {

        sharepoint = FFSharepoint.getInstance()
        agency = sharepoint.agency
        repository = sharepoint.repository
        manager =  agency.manager
        
        eventManager = manager.eventManager!
        networkManager = manager.networkManager!
        
        dataStorage = repository.dataStorage
        persistentStorage = repository.persistentStorage
        exchangeFlow = repository.exchangeFlow
        stateMachine = repository.stateMachine
        
    }
}
