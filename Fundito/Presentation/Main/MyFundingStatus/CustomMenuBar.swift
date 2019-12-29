////
////  CustomMenuBar.swift
////  Fundito
////
////  Created by kimhyeji on 12/26/19.
////  Copyright © 2019 Fundito. All rights reserved.
////
//
/**
 커스텀 탭바를 위한 몸부림1
 */

//import UIKit
//
//protocol CustomMenuBarDelegate: class {
//    func customMenuBar(scrollTo index: Int)
//}
//
//class CustomMenuBar: UIView {
//    
//    weak var delegate: CustomMenuBarDelegate?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        setupCustomTabBar()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // UITabBarItem 역할을 할 collectionView. 수평으로 설정.
//    var customTabBarCollectionView: UICollectionView = {
//        let collectionViewLayout = UICollectionViewFlowLayout()
//        collectionViewLayout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .white
//        return collectionView
//    }()
//    
//    // 현재 클릭 중인 탭바아이템을 알려줄 뷰
//    var indicatorView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .gray
//        return view
//    }()
//    
////    // 위 두 개 뷰를 담을 컨테이너 역할의 뷰
////    var customTabBar: UIView = {
////        let view = UIView()
////        view.backgroundColor = .white
////        view.translatesAutoresizingMaskIntoConstraints = false
////        return view
////    }()
//
//    //MARK: Properties
//    var indicatorViewLeadingConstraint:NSLayoutConstraint!
//    var indicatorViewWidthConstraint: NSLayoutConstraint!
//
//    //MARK: Setup Views
//    // collectionView 의 몇 몇 설정, extension에서 cell 이어주기
//    func setupCollectionView(){
//        customTabBarCollectionView.delegate = self
//        customTabBarCollectionView.dataSource = self
//        customTabBarCollectionView.showsHorizontalScrollIndicator = false
////        customTabBarCollectionView.register(UINib(nibName: CustomMenuBarCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: CustomMenuBarCell.reusableIdentifier)
//        customTabBarCollectionView.isScrollEnabled = false
//
//        let indexPath = IndexPath(item: 0, section: 0)
//        customTabBarCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
//    }
//
//    func setupCustomTabBar(){
//        setupCollectionView()
//        self.addSubview(customTabBarCollectionView)
//        customTabBarCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        customTabBarCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        customTabBarCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        customTabBarCollectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
//        
//        self.addSubview(indicatorView)
//        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width / 4)
//        indicatorViewWidthConstraint.isActive = true
//        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
//        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
//        indicatorViewLeadingConstraint.isActive = true
//        indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
//
//}
//
////MARK:- UICollectionViewDelegate, DataSource
//extension CustomMenuBar: UICollectionViewDelegate, UICollectionViewDataSource {
////
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CustomMenuBarCell.reusableIdentifier, for: indexPath) as! CustomMenuBarCell
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width / 4 , height: 55)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?.customMenuBar(scrollTo: indexPath.row)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomMenuBarCell else {return}
//        cell.label.textColor = .lightGray
//    }
//}
////MARK:- UICollectionViewDelegateFlowLayout
//extension CustomMenuBar: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
