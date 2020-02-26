//
//  Demonstrator-Authentication.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Authentication {
    
    public class Demonstrator: FFDemonstrator {
        
        private var module: Module!
        
        private var factory: Factory!
        
        private var sheetFactory: SheetFactory!
        private var transitionFactory: TransitionFactory!
        
        public required init() {
            
            module = Module.getInstance()
            
            factory = module.factory
            
            sheetFactory = factory.sheetFactory
            transitionFactory = factory.transitionFactory
            
        }
        
        public func goBack() {
            
            transition = transitionFactory.getFromLeftToRight()
            
            dismiss()
            
        }
        
        public func toMainSheet() {

            sheet = sheetFactory.getMainSheet()
            transition = transitionFactory.getFade()

            present()

        }

        public func toMainModule() {

            let mainModule = Main.Module.getInstance()
            let mainFactory = mainModule.factory!
            let mainSheetFactory = mainFactory.sheetFactory!
            
            sheet = mainSheetFactory.getMainSheet()
            transition = transitionFactory.getFromRightToLeft()
            
            present()

        }
        
    }
    
}
