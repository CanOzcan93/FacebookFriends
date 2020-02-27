//
//  ListView.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class ListView: FFListView<ListItemView> {
        
        public override func onInit() {
            self.backgroundColor = .white
        }
        
        public override func emptyMessage() -> String {
            return "Loading..."
        }
        
    }
    
}
