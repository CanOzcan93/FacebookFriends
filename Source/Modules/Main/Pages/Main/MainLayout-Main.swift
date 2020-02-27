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
        public var tv_logout: FFTextView!

        public override func onConstruct() {

            self.backgroundColor = colorProvider.getNormalBlue()
            constructListView()
            constructTitleTextView()
            constructLogoutTextView()

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
        
        private func constructLogoutTextView() {

            tv_logout = FFTextView()
            tv_logout.text = "Logout"
            tv_logout.textColor = colorProvider.getWhiteFull()
            tv_logout.textAlignment = .center
            tv_logout.font = fontProvider.getLightSmall()
            self.addSubview(tv_logout)

        }


        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainListView(set: &set)
            constrainTitleTextView(set: &set)
            constrainLogoutTextView(set: &set)
            
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
            set.append(NSLayoutConstraint(item: tv_title, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.6, constant: 0))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
        }
        
        private func constrainLogoutTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_logout, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_logout, attribute: .centerY, relatedBy: .equal, toItem: tv_title, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_logout, attribute: .right, relatedBy: .equal, toItem: tv_title, attribute: .left, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_logout, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        }

    }
}
