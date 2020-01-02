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
//        tab1CollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: "TabCollectionViewCell")
        
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
        tab1CollectionView.reloadData()
        if pos == 0 {
//            print(customTabView.curIndex) // 1
            print("tab1")
//            self.tab1CollectionView.alpha = 1.0
//            self.tab2CollectionView.alpha = 0.0
        } else {
//            print(customTabView.curIndex) // 0
            print("tab2")
//            self.tab1CollectionView.alpha = 0.0
//            self.tab2CollectionView.alpha = 1.0
        }
    }
}


extension SecondPopUpView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (customTabView.curIndex == 0){ //첫번째 탭 클릭했을때 customTabView.curIndex == 1
            print("tab111")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
            return cell
            
           
        } else { //두번째 탭 클릭 customTabView.curIndex == 0
            print("tab222")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tab2CollectionViewCell", for: indexPath) as! Tab2CollectionViewCell
            return cell
        }
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        
//        cell.backgroundColor = .white
//
//        return cell
    }
    
}

extension SecondPopUpView: UICollectionViewDelegate {

}
    

extension SecondPopUpView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 375
        let height = 70
//        let width = timelineCollectionView.bounds.width
//        let height = timelineCollectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}


extension SecondPopUpView {
//    func setTimelineData() {
//
//        let timeline1 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
//        let timeline2 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
//        let timeline3 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
//        let timeline4 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
//
//        // 생성한 timelineList 배열에 Timeline 모델들을 저장합니다.
//        timelineList = [timeline1, timeline2, timeline3, timeline4]
//    }
}


/**

 func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionView {
         let cell = collectionView.dequeueReusableCell(withIdentifier: "TabCollectionViewCell") as! TabCollectionViewCell
         cell.backgroundColor = .white
 //        cell.textLabel?.text = "\(indexPath.row)"
         return cell
 }         */

