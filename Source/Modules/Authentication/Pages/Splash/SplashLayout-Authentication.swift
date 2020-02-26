//
//  SplashLayout-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Authentication {
    
    public class SplashLayout: FFLayout {
        
        private var iv_logo: FFImageView!

        
        public override func onConstruct() {
    
            constructLogoImageView()
            
        }
        
        private func constructLogoImageView() {
            
            iv_logo = FFImageView()
            iv_logo.image = imageProvider.getLightLogo()
            self.addSubview(iv_logo)
            
        }
        
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            constrainLogoImageView(set: &set)
            
        }
        
        private func constrainLogoImageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
        }
    }
}
