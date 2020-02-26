//
//  Demonstrator-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
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

//        public func toDetailSheet() {
//
//            sheet = sheetFactory.getDetailSheet()
//            transition = transitionFactory.getFromRightToLeft()
//
//            present()
//
//        }
        
    }
    
}
