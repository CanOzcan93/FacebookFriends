//
//  MainSheet-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class MainSheet: Sheet<MainLayout> {
        
        public override func onLayoutReady(layout: MainLayout) {
            
            
            var items = [ListItemView(),ListItemView(),ListItemView()]
            for item in items {
                item.addAction {
                    item.addAction {
                        self.demonstrator.toDetailSheet()
                    }
                }
            }
            layout.lv.replaceItems(items)
            
        }
        
    }
    
}
