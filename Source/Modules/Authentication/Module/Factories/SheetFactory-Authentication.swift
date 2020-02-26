//
//  SheetFactory-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Authentication {
    
    public class SheetFactory: FFSheetFactory {
        
        private var mainSheet: MainSheet?
        public func getMainSheet() -> MainSheet {

            guard mainSheet != nil else {
                mainSheet = MainSheet()
                return mainSheet!
            }

            return mainSheet!

        }
        
        private var splashSheet: SplashSheet?
        public func getSplashSheet() -> SplashSheet {
            
            guard splashSheet != nil else {
                splashSheet = SplashSheet()
                return splashSheet!
            }
            
            return splashSheet!
            
        }
        
    }
}
