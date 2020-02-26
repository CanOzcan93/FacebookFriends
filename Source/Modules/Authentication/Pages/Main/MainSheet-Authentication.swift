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
                self.demonstrator.toMainModule()
            }
            
        }
        
    }
    
}
