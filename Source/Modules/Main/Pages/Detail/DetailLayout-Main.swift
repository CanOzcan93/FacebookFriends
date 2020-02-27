//
//  DetailLayout-Main.swift
//  FacebookFriends
//
//  Created by Can Özcan on 26.02.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import MapKit

extension Main {
    
    public class DetailLayout: FFLayout {
        
        private var mv: MKMapView!

        public override func onConstruct() {

            self.backgroundColor = colorProvider.getNormalBlue()
            constructMapView()

        }

        private func constructMapView() {

            mv = MKMapView()
            mv.translatesAutoresizingMaskIntoConstraints = false
            mv.isScrollEnabled = false
            mv.mapType = .mutedStandard
            mv.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200), animated: false)
            mv.setCenter(CLLocationCoordinate2D(latitude: 41.0459897, longitude: 29.0198998), animated: false)
            
            self.addSubview(mv)

        }


        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            constrainMapView(set: &set)

        }

        private func constrainMapView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: mv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 180))
        }

    }
}
