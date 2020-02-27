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
        private var tv_title: FFTextView!

        public override func onConstruct() {

            self.backgroundColor = colorProvider.getNormalBlue()
            constructListView()
            constructTitleTextView()

        }

        private func constructListView() {

            lv = ListView(items: [])
            self.addSubview(lv)

        }
        
        private func constructTitleTextView() {

            tv_title = FFTextView()
            tv_title.text = "Friend List"
            tv_title.textColor = colorProvider.getWhiteFull()
            tv_title.textAlignment = .center
            tv_title.font = fontProvider.getSemiboldBiggest()
            self.addSubview(tv_title)

        }


        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainListView(set: &set)
            constrainTitleTextView(set: &set)

        }

        private func constrainListView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: lv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 100))
            set.append(NSLayoutConstraint(item: lv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_title, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.8, constant: 0))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
        }

    }
}
