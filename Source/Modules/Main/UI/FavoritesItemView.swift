//
//  FavoritesItemView.swift
//  FacebookFriends
//
//  Created by Can Özcan on 27.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class FavoritesItemView : FFListItemView {
        
        
        private var tv_name: FFTextView!
        
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
        
        public func changeLabels(item: Favorite) {
            tv_name.text = "\(item.name) "
        }
        
        public func addAction(onClick: @escaping Action) {
            
            self.item.onTap {
                onClick()
            }
            
        }
        
        public override func onConstruct(wrapper: UIView, item: FFView) {
            
            super.onConstruct(wrapper: wrapper, item: item)
            wrapper.backgroundColor = .white
            constructTitleTextView(item: item)

        }

        private func constructTitleTextView(item: FFView) {

            self.tv_name = FFTextView()
            self.tv_name.textColor = colorProvider.getDarkGray()
            self.tv_name.text = "Can Ozcan"
            self.tv_name.textAlignment = .center
            
            item.addSubview(self.tv_name)

        }


        
        public override func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {
            
            super.onConstrain(set: &set, wrapper: wrapper, item: item)
            
            set.append(NSLayoutConstraint(item: wrapper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 80))
            
            set.append(NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: wrapper, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: wrapper, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: wrapper, attribute: .top, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: wrapper, attribute: .bottom, multiplier: 1, constant: -15))
            
            constrainTitleTextView(set: &set, wrapper: wrapper, item: item)
            
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint], wrapper: UIView, item: FFView) {

            set.append(NSLayoutConstraint(item: tv_name, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 1, constant: 0))

        }
        
        
    }
    
}
