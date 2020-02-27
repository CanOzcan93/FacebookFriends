//
//  MainSheet-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import RealmSwift

extension Main {
    
    public class MainSheet: Sheet<MainLayout> {
        
        public override func onLayoutReady(layout: MainLayout) {
            
            if let db = self.dataStorage.getDatabase() {
                if let user = db.object(ofType: User.self, forPrimaryKey:self.exchangeFlow.grabUsername()!) {
                    reloadData(user: user,layout: layout)
                }
            }
            
            self.apiManager.getFriendList(userID: self.exchangeFlow.grabUsername()!).done { (user) in
                
                if let db = self.dataStorage.getDatabase() {
                    do {
                        try db.write {
                            db.add(user, update: .all)
                            self.reloadData(user: user, layout: layout)
                        }
                    } catch {
                        print("Error updating User")
                    }
                }
            }
        }
        
        private func reloadData(user: User, layout: MainLayout) {
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
