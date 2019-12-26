//
//  MyFundingStatusVC3.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MyFundingStatusVC3: UIViewController, CustomMenuBarDelegate {
    
//    //MARK: Outltes
//    var pageCollectionView: UICollectionView = {
//        let collectionViewLayout = UICollectionViewFlowLayout()
//        collectionViewLayout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
   
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    var customMenuBar = CustomMenuBar()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRecognizer.direction = .down
        self.view.backgroundColor = .white
        title = "Navigation Bar Title"
        navigationController?.hidesBarsOnSwipe = true
        setupCustomTabBar()
//        setupPageCollectionView()
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            // none
        } else if sender.direction == .down {
            print("down(pop)")
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.easeInOut)
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
    
    //MARK: Setup view
    func setupCustomTabBar(){
        self.view.addSubview(customMenuBar)
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        customMenuBar.indicatorViewWidthConstraint.constant = self.view.frame.width / 4
        customMenuBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customMenuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
//        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
//    func setupPageCollectionView(){
//        pageCollectionView.delegate = self
//        pageCollectionView.dataSource = self
//        pageCollectionView.backgroundColor = .gray
//        pageCollectionView.showsHorizontalScrollIndicator = false
//        pageCollectionView.isPagingEnabled = true
//        pageCollectionView.register(UINib(nibName: PageCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PageCell.reusableIdentifier)
//        self.view.addSubview(pageCollectionView)
//        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        pageCollectionView.topAnchor.constraint(equalTo: self.customMenuBar.bottomAnchor).isActive = true
//    }

}

////MARK:- UICollectionViewDelegate, UICollectionViewDataSource
//extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.reusableIdentifier, for: indexPath) as! PageCell
//        cell.label.text = "\(indexPath.row + 1)번째 뷰"
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 4
//    }
//    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
//        let indexPath = IndexPath(item: itemAt, section: 0)
//        customMenuBar.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
//    }
//}
////MARK:- UICollectionViewDelegateFlowLayout
//extension MainVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
