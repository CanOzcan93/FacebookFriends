//
//  MainLayout-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class MainLayout: FFLayout {
        
        public var lv: ListView!

        public override func onConstruct() {

            self.backgroundColor = colorProvider.getNormalBlue()
            constructListView()

        }

        private func constructListView() {

            lv = ListView(items: [])
            self.addSubview(lv)

        }


        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            constrainListView(set: &set)

        }

        private func constrainListView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: lv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 100))
            set.append(NSLayoutConstraint(item: lv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        }

    }
}
