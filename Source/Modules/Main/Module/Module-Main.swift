//
//  Module-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class Module: FFModule<Factory, SheetFactory, TransitionFactory, Demonstrator> {
        
        public static var instance: Module?
        
        public static func getInstance() -> Module {
            
            guard instance != nil else {
                
                instance = Module()
                
                instance!.factory = Factory()
                instance!.factory!.sheetFactory = SheetFactory()
                instance!.factory!.transitionFactory = TransitionFactory()
                
                instance!.demonstrator = Demonstrator()
                
                return instance!
                
            }
            
            return instance!
            
        }
        
        public static func resetInstance() {
            
            instance = nil
            
        }
        
        
    }
    
}
