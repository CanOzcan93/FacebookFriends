//
//  FFApiManager.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

open class FFApiManager {
    
    public required init() {
        
    }
    
    private var sharepoint: FFSharepoint!
    
    private var agency: FFAgency!
    private var repository: FFRepository!
    
    private var manager: FFManager!
    
    private var eventManager: FFEventManager!
    private var networkManager: FFNetworkManager!
    
    private var dataStorage: FFDataStorage!
    private var persistentStorage: FFPersistentStorage!
    private var exchangeFlow: FFExchangeFlow!
    
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
        
    }
    
    public func getFriendList(userID: String) -> Promise<User> {
        
        return Promise(){ seal in
            Alamofire.request("https://api.myjson.com/bins/\(userID)").validate().responseJSON() { response in
                switch response.result {
                    case .success(let jsonData):
//                        guard let jsonDict = jsonData as? [String:Any] else { return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil)) }
//                        let jsonDictWithUser = ["username": userID,"friends": jsonDict] as [String : Any]
//                        let json = JSON(jsonDictWithUser)
                        var json = JSON()
                        json["username"] = JSON(userID)
                        json["friends"] = JSON(jsonData)
                        
                        let decoder = JSONDecoder()
                        do {
                            let user = try decoder.decode(User.self, from: json.rawData())
                            seal.fulfill(user)
                        } catch let error {
                            seal.reject(error)
                            print("JSON Decode Error:\n \(error)")
                        }
                    case .failure(let error):
                        seal.reject(error)
                    
                }
            }
            
        }
        
    }

}

