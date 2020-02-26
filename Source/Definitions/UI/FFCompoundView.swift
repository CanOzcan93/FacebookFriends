//
//  FFCompoundView.swift
//  FacebookFriends
//
//  Created by Can Özcan on 25.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class FFCompoundView: NSObject {
    
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    
    // Virtuals
    
    open func onInit() {}
//    open func onInjection() {}
    open func onConstruct(layout: FFLayout) {}
    open func onConstrain(set: inout [NSLayoutConstraint], layout: FFLayout) {}
    
    
    // Required Fields
    
    private var layout: FFLayout!
    
    
    // init
    
    public required init(layout: FFLayout) { super.init(); initialize(layout: layout) }
    private func initialize(layout: FFLayout) {
        
        self.layout = layout
        
        onInit()
        onInjection()
        
        self.set = [NSLayoutConstraint]()
        
        onConstruct(layout: self.layout)
        onConstrain(set: &self.set, layout: self.layout)
        
        if self.set.count != 0 {
            self.layout!.addConstraints(self.set)
            self.layout!.layoutIfNeeded()
        }
        
    }
    
    
    // Constraining
    
    public func relayout() {
        self.layout.layoutIfNeeded()
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.layout.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.layout.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
    public func shift(from: [NSLayoutConstraint], to: [NSLayoutConstraint]) {
        self.layout.removeConstraints(from)
        self.layout.addConstraints(to)
    }
    
    
    // Methods
    
    public func packView(_ view: UIView) {
        self.layout.addSubview(view)
    }
    
    // Sharepoint
    
    private var sharepoint: FFSharepoint!
    
    private var agency: FFAgency!
    
    private var provider: FFProvider!
    
    open var fontProvider: FFFontProvider!
    open var colorProvider: FFColorProvider!
    open var imageProvider: FFImageProvider!
    
    open func onInjection() {
        
        sharepoint = FFSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        fontProvider = provider.fontProvider
        colorProvider = provider.colorProvider
        imageProvider = provider.imageProvider
        
    }
    
}
