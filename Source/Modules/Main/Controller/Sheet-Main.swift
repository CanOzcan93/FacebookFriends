//
//  Sheet-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class Sheet<LayoutType: FFLayout>: FFSheet<LayoutType> {
        
        private var module: Module!

        open var demonstrator: Demonstrator!

        open override func onInjection() {

            super.onInjection()

            module = Module.getInstance()

            demonstrator = module.demonstrator

        }

        open override func viewDidAppear(_ animated: Bool) {

            super.viewDidAppear(animated)

            demonstrator.setCurrent(vc: self)

        }
    }
}
