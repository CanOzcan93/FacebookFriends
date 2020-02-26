//
//  Run.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

@UIApplicationMain
class App: FFApplication {
    
    override func onRootViewController() -> UIViewController? {
        
        return Authentication.Module.getInstance().factory.sheetFactory.getSplashSheet()
        
    }
    
}
