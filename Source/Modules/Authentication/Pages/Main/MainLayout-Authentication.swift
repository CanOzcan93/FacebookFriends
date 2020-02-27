//
//  MainLayout-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Authentication {
    
    public class MainLayout: FFLayout {
        
        private var iv_logo: FFImageView!
        public var ti_username: FFTextInput!
        public var btn_next: FFButton!
        
        private var isDefined = false
        
        public override func onConstruct() {
            
            self.backgroundColor = colorProvider.getNormalBlue()
            self.setTouchEvent = {
                self.endEditing(true)
            }
            constructLogoImageView()
            constructUsernameTextInput()
            constructNextTextView()
        }
        
        private func constructLogoImageView() {
            
            iv_logo = FFImageView()
            iv_logo.image = imageProvider.getLightLogo()
            self.addSubview(iv_logo)
            
        }
        
        private func constructUsernameTextInput() {
            
            ti_username = FFTextInput()
            ti_username.setPlaceholder(text: "Write Your Username", placeholderColor: self.colorProvider.getPureGray())
            ti_username.textColor = .black
            ti_username.activateMovement(layout: self)
            ti_username.onDraw = { rect in
                if !self.isDefined {
                    let outsideRect = rect.insetBy(dx: -10, dy: 0)
                    let path = UIBezierPath(roundedRect: outsideRect, cornerRadius: rect.height*0.2).cgPath
                    let shadowPath = UIBezierPath(roundedRect: outsideRect.inset(by: UIEdgeInsets(top: -0.1, left: -0.1, bottom: -0.1, right: -0.1)), cornerRadius: 8).cgPath

                    let layer = CAShapeLayer()
                    layer.path = path
                    layer.fillColor = self.colorProvider.getWhiteFull().cgColor

                    layer.shadowColor = self.colorProvider.getBlackFull().cgColor
                    layer.shadowPath = shadowPath
                    layer.shadowOffset = .zero
                    layer.shadowOpacity = 0.2
                    layer.shadowRadius = 8

                    self.ti_username.layer.insertSublayer(layer, at: 0)
                    self.isDefined = true
                }
            }
            self.addSubview(ti_username)
            
        }
        
        private func constructNextTextView() {
            
            btn_next = FFButton()
            btn_next.clipsToBounds = true
            btn_next.backgroundColor = colorProvider.getWhiteFull()
            btn_next.setTitleColor(colorProvider.getNormalBlue(), for: .normal)
            btn_next.setTitle("Next", for: .normal)
            btn_next.onDraw = { rect in
                
                if !self.isDefined {
                    self.btn_next.layer.cornerRadius = rect.height*0.5
                }
                
            }
            self.addSubview(btn_next)
            
        }
        
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            constrainLogoImageView(set: &set)
            constrainUsernameTextInput(set: &set)
            constrainNextTextView(set: &set)
            
        }
        
        private func constrainLogoImageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.5, constant: 0))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
            set.append(NSLayoutConstraint(item: iv_logo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
        }
        
        private func constrainUsernameTextInput(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: ti_username, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: ti_username, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: ti_username, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.7, constant: 0))
            set.append(NSLayoutConstraint(item: ti_username, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
        
        private func constrainNextTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: btn_next, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.5, constant: 0))
            set.append(NSLayoutConstraint(item: btn_next, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 0.75, constant: 0))
            set.append(NSLayoutConstraint(item: btn_next, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
            set.append(NSLayoutConstraint(item: btn_next, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
    }
}
