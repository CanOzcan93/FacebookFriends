//
//  FFSheet.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

import UIKit

open class FFSheet<LayoutType: FFLayout>: UIViewController {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    private var initialized: Bool = false
    
    private var layout: LayoutType!
    
    open func onInit() {}
    open func onLayoutReady(layout: LayoutType) {}
    open func onLayoutAppear(layout: LayoutType) {}
    open func onLayoutFirstAppear(layout: LayoutType) {}
    open func onLayoutReappear(layout: LayoutType) {}
    open func onLayoutDisappear(layout: LayoutType) {}
    
    open func onDismiss() {}
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onInjection()
        
        onInit()
        
        layout = LayoutType.init()
        
        self.view = layout
        
        onLayoutReady(layout: layout)
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if (initialized) {
            onLayoutReappear(layout: layout)
        }
        else {
            onLayoutFirstAppear(layout: layout)
        }
        onLayoutAppear(layout: layout)
        
        self.initialized = true
        
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        
        onLayoutDisappear(layout: layout)
        
        super.viewDidDisappear(animated)
        
        
    }
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        onDismiss()
        
        super.dismiss(animated: flag, completion: completion)
        
    }
    
    /*
     -
     -
     // MARK: Sharepoint Definitions
     -
     -
     */
    
    private var sharepoint: FFSharepoint!
    
    private var agency: FFAgency!
    private var repository: FFRepository!
    
    private var manager: FFManager!
    private var provider: FFProvider!
    
    open var apiManager: FFApiManager!
    open var eventManager: FFEventManager!
    open var networkManager: FFNetworkManager!
    open var mediaManager: FFMediaManager!
    
    open var fontProvider: FFFontProvider!
    open var colorProvider: FFColorProvider!
    open var imageProvider: FFImageProvider!
    
    open var dataStorage: FFDataStorage!
    open var exchangeFlow: FFExchangeFlow!
    open var persistentStorage: FFPersistentStorage!
    open var stateMachine: FFStateMachine!
    
    open func onInjection() {
        
        sharepoint = FFSharepoint.getInstance()
        
        agency = sharepoint.agency
        repository = sharepoint.repository
        
        manager = agency.manager
        provider = agency.provider
        
        apiManager = manager.apiManager
        eventManager = manager.eventManager
        networkManager = manager.networkManager
        mediaManager = manager.mediaManager
        
        colorProvider = provider.colorProvider
        fontProvider = provider.fontProvider
        imageProvider = provider.imageProvider
        
        dataStorage = repository.dataStorage
        exchangeFlow = repository.exchangeFlow
        persistentStorage = repository.persistentStorage
        stateMachine = repository.stateMachine
        
    }
    
}
