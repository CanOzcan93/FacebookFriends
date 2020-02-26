//
//  FFApplication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
import UIKit

open class FFApplication: UIResponder, UIApplicationDelegate {
    
    public static var instance: FFApplication!
    public static var window: UIWindow!
    public static var application: UIApplication!
        
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FFApplication.instance = self
        FFApplication.window = UIWindow(frame: UIScreen.main.bounds)
        FFApplication.application = application
        
        FFApplication.window.rootViewController = onRootViewController()!
        FFApplication.window.makeKeyAndVisible()
        
        FFApplication.window.backgroundColor = UIColor.white
        
        return true
        
    }
    
    open func onRootViewController() -> UIViewController? {
        return nil
    }
    
}
