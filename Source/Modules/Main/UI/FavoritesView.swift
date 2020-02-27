//
//  FavoritesView.swift
//  FacebookFriends
//
//  Created by Can Özcan on 27.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class FavoritesView: FFListView<FavoritesItemView> {
        
        public override func onInit() {
            self.backgroundColor = .white
        }
        
        public override func emptyMessage() -> String {
            return "Loading..."
        }
        
    }
    
}
