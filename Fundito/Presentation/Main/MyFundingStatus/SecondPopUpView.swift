//
//  SecondPopUpView.swift
//  Fundito
//
//  Created by kimhyeji on 12/29/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class SecondPopUpView: UIView {
    
    
    @IBOutlet weak var customTabView: CustomTabView!
    @IBOutlet weak var topReceiptImage: UIImageView!
    @IBOutlet weak var tab1CollectionView: UICollectionView!
//    @IBOutlet weak var tab2CollectionView: UICollectionView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("SecondPopUpViewInit")
//        customTabView?.delegate = SecondPopUpView as CustomTabViewDelegate
//        customTabView?.delegate = self as CustomTabViewDelegate
//        initView()
    }
    
    func viewInit(){
        customTabView?.delegate = self as CustomTabViewDelegate
        tab1CollectionView.dataSource = self
//        tab1CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        tab1CollectionView.delegate = self
        tab1CollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: "TabCollectionViewCell")
        
//        tab2CollectionView.dataSource = self
//        tab2CollectionView.collectionViewLayout = UICollectionViewFlowLayout(
//        tab2CollectionView.delegate = self
        
//        tab2CollectionView.alpha = 0.0
        
    }
    
}

// TabCollectionViewCell

extension SecondPopUpView {
    
//    func viewInit(){
//        customTabView?.delegate = self as CustomTabViewDelegate
//        tab1CollectionView.delegate = self
//        tab1CollectionView.dataSource = self
//    }
}

extension SecondPopUpView:  CustomTabViewDelegate {
    func onTabSelected(pos: Int) {
//        print(customTabView.curIndex)
//        print(pos)
        if pos == 0 {
            print("tab1")
            self.tab1CollectionView.alpha = 1.0
//            self.tab2CollectionView.alpha = 0.0
        } else {
            print("tab2")
            self.tab1CollectionView.alpha = 0.0
//            self.tab2CollectionView.alpha = 1.0
        }
    }
}

//extension SecondPopUpView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 375, height: 70)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//    }
//}

extension SecondPopUpView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if true { //첫번째 탭 클릭했을때
//            let cell
//
//            return cell
//        } else { //두번째 탭 클릭
//
//        }
//
        
        //------------------
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
//        cell.frame.size = CGSize(width: 375, height: 70)
        cell.backgroundColor = .white

        return cell
    }
    
}

extension SecondPopUpView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

           return CGSize(width: 375 , height: 70)
       }

       public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{

        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)

       }
}
    

/**

 func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionView {
         let cell = collectionView.dequeueReusableCell(withIdentifier: "TabCollectionViewCell") as! TabCollectionViewCell
         cell.backgroundColor = .white
 //        cell.textLabel?.text = "\(indexPath.row)"
         return cell
 }         */

