//
//  ListItemView.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class ListItemView : FFListItemView {
        
        
        private var v_gender: FFView!
        private var tv_name_age: FFTextView!
        private var v_active: FFView!
        
        private var isInitialized: Bool = false
        
        public override func onInit() {
            self.item = FFView()
            self.item.isOpaque = false
            self.isUserInteractionEnabled = true
            self.selectionStyle = .none
            
            
            self.item.onDraw = { rect in

                if !self.isInitialized {
                    
                    let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height*0.2).cgPath
                    let shadowPath = UIBezierPath(roundedRect: rect.inset(by: UIEdgeInsets(top: -0.1, left: -0.1, bottom: -0.1, right: -0.1)), cornerRadius: 8).cgPath

                    let layer = CAShapeLayer()
                    layer.path = path
                    layer.fillColor = UIColor(white: 1, alpha: 1).cgColor

                    layer.shadowColor = self.colorProvider.getBlackFull().cgColor
                    layer.shadowPath = shadowPath
                    layer.shadowOffset = .zero
                    layer.shadowOpacity = 0.2
                    layer.shadowRadius = 8

                    self.item.layer.insertSublayer(layer, at: 0)
                    
                }

            }
            
            contentView.addSubview(self.item)
            
        }
        
        public func changeLabels(item: Friend) {
            if item.gender == "male" {
                v_gender.backgroundColor = .systemBlue
            } else {
                v_gender.backgroundColor = .systemPink
            }
            if item.isActive {
                v_active.backgroundColor = .green
            } else {
                v_active.backgroundColor = .red
            }
            tv_name_age.text = "\(item.name) / \(item.age) "
        }
        
        public func addAction(onClick: @escaping Action) {
            
            self.item.onTap {
                onClick()
            }
            
        }
        
        public override func onConstruct(wrapper: UIView, item: FFView) {
            
            super.onConstruct(wrapper: wrapper, item: item)
            wrapper.backgroundColor = .white
            
            constructActiveCircle(item: item)
            constructGenderCircle(item: item)
            constructTitleTextView(item: item)

        }
        
        private func constructGenderCircle(item: FFView) {
            
            self.v_gender = FFView()
            self.v_gender.backgroundColor = .systemPink
            self.v_gender.clipsToBounds = true
            self.v_gender.onDraw = { rect in
                
                if !self.isInitialized {
                    
                    self.v_gender.layer.cornerRadius = rect.height*0.5
                    
                }
                
            }
            
            item.addSubview(self.v_gender)
            
        }

        private func constructTitleTextView(item: FFView) {

            self.tv_name_age = FFTextView()
            self.tv_name_age.textColor = colorProvider.getDarkGray()
            self.tv_name_age.text = "Can Ozcan / 24"
            
            item.addSubview(self.tv_name_age)

        }
        
        private func constructActiveCircle(item: FFView) {
            
            self.v_active = FFView()
            self.v_active.backgroundColor = .red
            self.v_active.clipsToBounds = true
            self.v_active.onDraw = { rect in
                
                if !self.isInitialized {
                    
                    self.v_active.layer.cornerRadius = rect.height*0.5
                    self.isInitialized = true
                    
                }
                
            }
            
            item.addSubview(self.v_active)
            
        }


        
        public override func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {
            
            super.onConstrain(set: &set, wrapper: wrapper, item: item)
            
            set.append(NSLayoutConstraint(item: wrapper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
            
            set.append(NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: wrapper, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: wrapper, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: wrapper, attribute: .top, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: wrapper, attribute: .bottom, multiplier: 1, constant: -15))
            
            constrainGenderCircle(set: &set, wrapper: wrapper, item: item)
            constrainTitleTextView(set: &set, wrapper: wrapper, item: item)
            constrainActiveCircle(set: &set, wrapper: wrapper, item: item)
            
        }
        
        private func constrainGenderCircle(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {
            
            set.append(NSLayoutConstraint(item: v_gender, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 7.5))
            set.append(NSLayoutConstraint(item: v_gender, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_gender, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: v_gender, attribute: .width, relatedBy: .equal, toItem: v_gender, attribute: .height, multiplier: 1, constant: 0))
            
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {

            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .left, relatedBy: .equal, toItem: v_gender, attribute: .right, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -25))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 0.5, constant: 0))

        }
        
        private func constrainActiveCircle(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {

            set.append(NSLayoutConstraint(item: v_active, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_active, attribute: .width, relatedBy: .equal, toItem: v_active, attribute: .height, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_active, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: v_active, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 10))

        }
        
        
    }
    
}
