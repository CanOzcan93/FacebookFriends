//
//  FFDemonstrator.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class FFDemonstrator {
    
    open var sheet: UIViewController!
    open var transition: CATransition!
    
    public required init() {
        
    }
    
    open var current: UIViewController!
    public func setCurrent(vc: UIViewController) {
        current = vc
    }
    
    open func present() {
        
        FFApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: nil)
        
    }
    
    open func present(completion: @escaping () -> ()) {
        
        FFApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: completion)
        
    }
    
    open func dismiss() {
        
        FFApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismiss(completion: @escaping () -> ()) {
        
        FFApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissNotAnimated() {
        
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismissNotAnimated(completion: @escaping () -> ()) {
        
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissViewControllers() {
        FFApplication.window.rootViewController?.dismiss(animated: false) {
        }
    }
    
    open func dismissViewControllers(completion: @escaping () -> ()) {
        FFApplication.window.rootViewController?.dismiss(animated: false) {
            completion()
        }
    }
        
}
