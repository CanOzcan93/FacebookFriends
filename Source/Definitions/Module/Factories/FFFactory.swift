//
//  FFFactory.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class FFFactory<SheetFactoryType: FFSheetFactory, TransitionFactoryType: FFTransitionFactory>{
    
    public var sheetFactory: SheetFactoryType!
    public var transitionFactory: TransitionFactoryType!
    
    public required init() {
        
    }
    
}
