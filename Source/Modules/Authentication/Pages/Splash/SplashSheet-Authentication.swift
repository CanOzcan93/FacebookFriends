//
//  SplashSheet-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit


extension Authentication {
    
    public class SplashSheet: Sheet<SplashLayout> {
        
        public override func onLayoutReady(layout: SplashLayout) {
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                self.demonstrator.toMainSheet()
            }
            
        }
        
    }
    
}
