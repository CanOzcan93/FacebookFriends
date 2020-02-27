//
//  FFImageProvider.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class FFImageProvider {
    
    public required init() {
        
    }
    
    private var left_arrow: UIImage?
    public func getLeftArrow() -> UIImage {
        
        guard left_arrow != nil else {
            left_arrow = UIImage(named: "ic_left_arrow_white")
            return left_arrow!
        }
        
        return left_arrow!
        
    }
    
    private var logo_filled: UIImage?
    public func getFilledLogo() -> UIImage {
        
        guard logo_filled != nil else {
            logo_filled = UIImage(named: "logo_filled")
            return logo_filled!
        }
        
        return logo_filled!
        
    }
    
    private var logo_light: UIImage?
    public func getLightLogo() -> UIImage {
        
        guard logo_light != nil else {
            logo_light = UIImage(named: "logo_light")
            return logo_light!
        }
        
        return logo_light!
        
    }
    
}
