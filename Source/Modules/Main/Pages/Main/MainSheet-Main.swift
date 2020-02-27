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
            
            
            self.apiManager.getFriendList(userID: self.exchangeFlow.grabUsername()!).done { (user) in
                var items = [ListItemView]()
                for friend in user.friendList {
                    let listItem = ListItemView()
                    listItem.changeLabels(item: friend)
                    listItem.addAction {
                        self.exchangeFlow.letSelectedFriend(friend: friend)
                        self.demonstrator.toDetailSheet()
                    }
                    items.append(listItem)
                }
                layout.lv.replaceItems(items)
            }
            
        }
        
    }
    
}
