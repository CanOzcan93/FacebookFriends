//
//  DetailSheet-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class DetailSheet: Sheet<DetailLayout> {
        
        public override func onLayoutReady(layout: DetailLayout) {
            
//            let friend = self.exchangeFlow.grabSelectedFriend()!
//            layout.reloadPage(item: friend)
            layout.iv_back.onTap {
                self.demonstrator.goBack()
                layout.goInfo()
            }
            
        }
        
        public override func onLayoutAppear(layout: DetailLayout) {
            
            let friend = self.exchangeFlow.grabSelectedFriend()!
            layout.reloadPage(item: friend)
            
        }
        
        
        
    }
    
}
