//
//  SecondPopUpView.swift
//  Fundito
//
//  Created by kimhyeji on 12/29/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class SecondPopUpView: UIView {

    @IBOutlet weak var topReceiptImage: UIImageView!
    

    func viewInit(){
//        setupCustomTabBar()
//        setupCollectioView()
        self.addSubview(customTabBarCollectionView)
    }
    
    
    var customTabBarCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 300, y: 300, width: 500, height: 60), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    var customTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupCollectioView(){
        customTabBarCollectionView.delegate = self
        customTabBarCollectionView.dataSource = self
        customTabBarCollectionView.backgroundColor = .white
        customTabBarCollectionView.showsHorizontalScrollIndicator = false
        customTabBarCollectionView.isScrollEnabled = false
    }
    
    var indicatorViewLeadingConstraint:NSLayoutConstraint! // ---- *
    func setupCustomTabBar(){
        setupCollectioView()
        self.addSubview(customTabBar)
        customTabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        customTabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        customTabBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true // ---- *
        customTabBar.heightAnchor.constraint(equalToConstant: 60).isActive = true

        customTabBar.addSubview(customTabBarCollectionView)
        customTabBarCollectionView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor).isActive = true
        customTabBarCollectionView.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor).isActive = true
        customTabBarCollectionView.topAnchor.constraint(equalTo: customTabBar.topAnchor).isActive = true
        customTabBarCollectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true

        customTabBar.addSubview(indicatorView)
        indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width/4).isActive = true // ---- *
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
    }

}

extension SecondPopUpView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CustomMenuBarCell.reusableIdentifier, for: indexPath) as! CustomMenuBarCell
//        if indexPath.row == 0 {
//            cell.label.textColor = .black
//            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
//        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2

    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width / 4 , height: 55)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    } // ---- 1
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    } // ---- 2
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CustomMenuBarCell.reusableIdentifier, for: indexPath) as! CustomMenuBarCell
//        cell.label.textColor = .black
//        indicatorViewLeadingConstraint.constant = (self.frame.width / 4) * CGFloat((indexPath.row))
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.customTabBar.layoutIfNeeded()
//        }, completion: nil)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CustomMenuBarCell.reusableIdentifier, for: indexPath) as! CustomMenuBarCell
//        cell.label.textColor = .lightGray
//    }

}



