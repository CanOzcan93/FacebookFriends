//
//  FFModule.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFModule<FactoryType: FFFactory<SheetFactoryType,TransitionFactoryType>,SheetFactoryType: FFSheetFactory,TransitionFactoryType: FFTransitionFactory, DemonstratorType: FFDemonstrator> {
    
    public var factory: FactoryType!
    public var demonstrator: DemonstratorType!
    
    public required init() {
        
    }
    
}
