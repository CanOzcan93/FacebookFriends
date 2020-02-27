//
//  MainSheet-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Authentication {
    
    public class MainSheet: Sheet<MainLayout> {
        
        public override func onLayoutReady(layout: MainLayout) {
            
            layout.btn_next.onClick {
                if layout.ti_username.text == "9nd54" || layout.ti_username.text == "v542w" || layout.ti_username.text == "17pcy0" || layout.ti_username.text == "gbf48" || layout.ti_username.text == "zdah4" {
                    self.exchangeFlow.letUsername(username: layout.ti_username.text!)
                    self.demonstrator.toMainModule()
                }
            }
            
//            self.apiManager.getFriendList(userID: "gbf48").done { (user) in
//                print(user)
//            }
            
        }
        
    }
    
}
