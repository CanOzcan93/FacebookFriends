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
        private var tv_address: FFTextView!
        public var iv_back: FFImageView!
        private var tv_name_age: FFTextView!
        private var v_block: FFView!
        private var btn_block_first: FFButton!
        private var btn_block_second: FFButton!
        private var v_info_page: FFView!
        private var v_friends_page: FFView!
        private var tv_about: FFTextView!
        private var tv_phone: FFTextView!
        private var tv_company: FFTextView!
        private var tv_email: FFTextView!
        private var lv_favorites: FavoritesView!
        
        private var showInfoConstraint: NSLayoutConstraint!
        private var hideInfoConstraint: NSLayoutConstraint!
        private var isReady = false

        public override func onConstruct() {

            self.backgroundColor = colorProvider.getNormalBlue()
            constructMapView()
            constructAddressTextView()
            constructBackImageView()
            constructNameAgeTextView()
            constructBlockView()
            constructFirstBlockButton()
            constructSecondBlockButton()
            constructInfoPageView()
            constructFriendsPageView()
            constructAboutTextView()
            constructPhoneTextView()
            constructCompanyTextView()
            constructEmailTextView()
            constructFavoritesListView()
        }

        private func constructMapView() {

            mv = MKMapView()
            mv.translatesAutoresizingMaskIntoConstraints = false
            mv.isUserInteractionEnabled = false
            let mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.0459897, longitude: 29.0198998), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mv.setRegion(mapRegion, animated: false)
            
            self.addSubview(mv)

        }
        
        private func constructAddressTextView() {

            tv_address = FFTextView()
            tv_address.backgroundColor = colorProvider.getWhiteFull()
            tv_address.textColor = .black
            tv_address.clipsToBounds = true
            tv_address.numberOfLines = 2
            tv_address.font = fontProvider.getRegularSmaller()
            tv_address.text = "645 Sheffield Avenue, Noblestown, Massachusetts, 8384"
            tv_address.onDraw = { rect in
                if !self.isReady {
                    self.tv_address.layer.cornerRadius = rect.height/5
                }
            }
            self.addSubview(tv_address)

        }
        
        private func constructBackImageView() {

            iv_back = FFImageView()
            iv_back.image = imageProvider.getLeftArrow()
            self.addSubview(iv_back)

        }

        private func constructNameAgeTextView() {

            tv_name_age = FFTextView()
            tv_name_age.textColor = .white
            tv_name_age.text = "Can Ozcan / 24"
            tv_name_age.font = fontProvider.getSemiboldLargest()
            self.addSubview(tv_name_age)

        }
        
        private func constructBlockView() {

            v_block = FFView()
            v_block.backgroundColor = colorProvider.getGrayLight()
            self.addSubview(v_block)

        }
        
        private func constructFirstBlockButton() {

            btn_block_first = FFButton()
            btn_block_first.setTitleColor(colorProvider.getNormalBlue(), for: .normal)
            btn_block_first.backgroundColor = .white
            btn_block_first.setTitle("Info", for: .normal)
            btn_block_first.onClick {
                self.goInfo()
            }
            self.addSubview(btn_block_first)

        }
        
        private func constructSecondBlockButton() {

            btn_block_second = FFButton()
            btn_block_second.setTitleColor(.white, for: .normal)
            btn_block_second.backgroundColor = colorProvider.getNormalBlue()
            btn_block_second.setTitle("Favorites", for: .normal)
            btn_block_second.onClick {
                self.btn_block_first.setTitleColor(.white, for: .normal)
                self.btn_block_first.backgroundColor = self.colorProvider.getNormalBlue()
                self.btn_block_second.setTitleColor(self.colorProvider.getNormalBlue(), for: .normal)
                self.btn_block_second.backgroundColor = .white
                self.shift(from: self.showInfoConstraint, to: self.hideInfoConstraint)
                UIView.animate(withDuration: 0.1) {
                    self.relayout()
                }
            }
            self.addSubview(btn_block_second)

        }
        
        private func constructInfoPageView() {

            v_info_page = FFView()
            v_info_page.backgroundColor = .white
            self.addSubview(v_info_page)

        }
        
        private func constructFriendsPageView() {

            v_friends_page = FFView()
            v_friends_page.backgroundColor = .red
            self.addSubview(v_friends_page)

        }
        
        private func constructAboutTextView() {

            tv_about = FFTextView()
            tv_about.font = fontProvider.getRegularSmaller()
            tv_about.textColor = .black
            tv_about.numberOfLines = 0
            tv_about.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultrices magna nec erat mollis, quis tincidunt orci imperdiet. Maecenas at dapibus neque. Curabitur faucibus orci ligula, a porta nibh dictum id. Fusce ut posuere est. Orci varius natoque penatibus et."
            self.addSubview(tv_about)

        }
        
        private func constructPhoneTextView() {

            tv_phone = FFTextView()
            tv_phone.font = fontProvider.getRegularSmaller()
            tv_phone.textColor = .black
            tv_phone.text = "Phone: +1 (847) 594-2152"
            self.addSubview(tv_phone)

        }
        
        private func constructCompanyTextView() {

            tv_company = FFTextView()
            tv_company.font = fontProvider.getRegularSmaller()
            tv_company.textColor = .black
            tv_company.text = "Company: Calcula"
            self.addSubview(tv_company)

        }
        
        private func constructEmailTextView() {

            tv_email = FFTextView()
            tv_email.font = fontProvider.getRegularSmaller()
            tv_email.textColor = .black
            tv_email.text = "Email: lesleysheppard@calcula.com"
            self.addSubview(tv_email)

        }
        
        private func constructFavoritesListView() {

            lv_favorites = FavoritesView(items: [FavoritesItemView(),FavoritesItemView(),FavoritesItemView()])
            self.addSubview(lv_favorites)

        }

        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainMapView(set: &set)
            constrainAddressTextView(set: &set)
            constrainBackImageView(set: &set)
            constrainNameAgeTextView(set: &set)
            constrainBlockView(set: &set)
            constrainFirstBlockButton(set: &set)
            constrainSecondBlockButton(set: &set)
            constrainInfoPageView(set: &set)
            constrainFriendsPageView(set: &set)
            constrainAboutTextView(set: &set)
            constrainPhoneTextView(set: &set)
            constrainCompanyTextView(set: &set)
            constrainEmailTextView(set: &set)
            constrainFavoritesListView(set: &set)
            
        }

        private func constrainMapView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: mv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: mv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 180))
        }
        
        private func constrainAddressTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_address, attribute: .centerX, relatedBy: .equal, toItem: mv, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_address, attribute: .bottom, relatedBy: .equal, toItem: mv, attribute: .centerY, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_address, attribute: .width, relatedBy: .equal, toItem: mv, attribute: .width, multiplier: 0.6, constant: 0))
            set.append(NSLayoutConstraint(item: tv_address, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
        }
        
        private func constrainBackImageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: iv_back, attribute: .left, relatedBy: .equal, toItem: mv, attribute: .left, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .top, relatedBy: .equal, toItem: mv, attribute: .top, multiplier: 1, constant: 25))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .width, relatedBy: .equal, toItem: iv_back, attribute: .height, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainNameAgeTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .top, relatedBy: .equal, toItem: mv, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_name_age, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainBlockView(set: inout [NSLayoutConstraint]) {

            set.append(NSLayoutConstraint(item: v_block, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_block, attribute: .top, relatedBy: .equal, toItem: tv_name_age, attribute: .bottom, multiplier: 1, constant: 18))
            set.append(NSLayoutConstraint(item: v_block, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_block, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 34))

        }
        
        private func constrainFirstBlockButton(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: btn_block_first, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_block_first, attribute: .top, relatedBy: .equal, toItem: tv_name_age, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_block_first, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -2))
            set.append(NSLayoutConstraint(item: btn_block_first, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainSecondBlockButton(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: btn_block_second, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_block_second, attribute: .top, relatedBy: .equal, toItem: tv_name_age, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_block_second, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: -2))
            set.append(NSLayoutConstraint(item: btn_block_second, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainInfoPageView(set: inout [NSLayoutConstraint]) {
            showInfoConstraint = NSLayoutConstraint(item: v_info_page, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
            hideInfoConstraint = NSLayoutConstraint(item: v_info_page, attribute: .right, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
            set.append(showInfoConstraint)
            set.append(NSLayoutConstraint(item: v_info_page, attribute: .top, relatedBy: .equal, toItem: v_block, attribute: .bottom, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_info_page, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_info_page, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        }
        
        private func constrainFriendsPageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: v_friends_page, attribute: .left, relatedBy: .equal, toItem: v_info_page, attribute: .right, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_friends_page, attribute: .top, relatedBy: .equal, toItem: v_block, attribute: .bottom, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_friends_page, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: v_friends_page, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        }
        
        private func constrainAboutTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_about, attribute: .centerX, relatedBy: .equal, toItem: v_info_page, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_about, attribute: .top, relatedBy: .equal, toItem: v_info_page, attribute: .top, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: tv_about, attribute: .width, relatedBy: .equal, toItem: v_info_page, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_about, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        }
        
        private func constrainPhoneTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_phone, attribute: .centerX, relatedBy: .equal, toItem: v_info_page, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_phone, attribute: .top, relatedBy: .equal, toItem: tv_about, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_phone, attribute: .width, relatedBy: .equal, toItem: v_info_page, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_phone, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 10))
        }
        
        private func constrainCompanyTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_company, attribute: .centerX, relatedBy: .equal, toItem: v_info_page, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_company, attribute: .top, relatedBy: .equal, toItem: tv_phone, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_company, attribute: .width, relatedBy: .equal, toItem: v_info_page, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_company, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 10))
        }
        
        private func constrainEmailTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_email, attribute: .centerX, relatedBy: .equal, toItem: v_info_page, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_email, attribute: .top, relatedBy: .equal, toItem: tv_company, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_email, attribute: .width, relatedBy: .equal, toItem: v_info_page, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_email, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 10))
        }
        
        private func constrainFavoritesListView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: lv_favorites, attribute: .centerX, relatedBy: .equal, toItem: v_friends_page, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv_favorites, attribute: .top, relatedBy: .equal, toItem: v_friends_page, attribute: .top, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv_favorites, attribute: .width, relatedBy: .equal, toItem: v_friends_page, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv_favorites, attribute: .bottom, relatedBy: .equal, toItem: v_friends_page, attribute: .bottom, multiplier: 1, constant: 0))
        }
        
        public func reloadPage(item:Friend) {
        
            mv.setCenter(CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude), animated: false)
            tv_address.text = item.address
            tv_name_age.text = "\(item.name) / \(item.age)"
            tv_about.text = item.about
            tv_phone.text = "Phone: \(item.phone)"
            tv_company.text = "Company: \(item.company)"
            tv_email.text = "Email: \(item.email)"
            
            var listItems = [FavoritesItemView]()
            for favorite in item.favoriteList {
                
                let favoritesItem = FavoritesItemView()
                favoritesItem.changeLabels(item: favorite)
                listItems.append(favoritesItem)
                
            }
            lv_favorites.replaceItems(listItems)
            
        }
        
        public func goInfo() {
            self.btn_block_second.setTitleColor(.white, for: .normal)
            self.btn_block_second.backgroundColor = self.colorProvider.getNormalBlue()
            self.btn_block_first.setTitleColor(self.colorProvider.getNormalBlue(), for: .normal)
            self.btn_block_first.backgroundColor = .white
            self.shift(from: self.hideInfoConstraint, to: self.showInfoConstraint)
            UIView.animate(withDuration: 0.1) {
                self.relayout()
            }
        }
        

    }
}
