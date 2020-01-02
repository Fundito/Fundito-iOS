//
//  MyFundingStatusVC3.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

/**
 세번째 뷰의 커스텀 탭바에 따라 나타나는 페이지의 테이블 뷰 
 */

import UIKit

class Cell: UICollectionViewCell{

    static var identifier: String = "Cell"
    
    //부모 메서드 초기화 시켜줘야 한다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var storeName: UILabel = {
        let storeName = UILabel()
        storeName.text = "#가게이름"
        storeName.textColor = .black
        storeName.textAlignment = .center
        storeName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        storeName.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
        return storeName
    }()
    
    var fundingLeftDate: UILabel = {
        let fundingLeftDate = UILabel()
        fundingLeftDate.text = "#duedate-today"+"일 남음"
        fundingLeftDate.textColor = .black
        fundingLeftDate.textAlignment = .center
        fundingLeftDate.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        fundingLeftDate.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
        return fundingLeftDate
    }()
    
    var successPercent: UILabel = {
        let successPercent = UILabel()
        successPercent.text = "#percent계산"+"달성중"
        successPercent.textColor = .black
        successPercent.textAlignment = .center
        successPercent.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        successPercent.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
        return successPercent
    }()

    func setupView(){
        backgroundColor = .white
        
        // 셀에 레이블 추가
        self.contentView.addSubview(storeName)
        self.contentView.addSubview(fundingLeftDate)
        self.contentView.addSubview(successPercent)

        //제약조건 설정하기
        storeName.topAnchor.constraint(equalTo: self.topAnchor, constant:11).isActive = true
        storeName.leftAnchor.constraint(equalTo: self.leftAnchor, constant:16).isActive = true
//        storeName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        storeName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //storeName.widthAnchor.constraint(equalToConstant: 0).isActive = true
        //storeName.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
//        fundingLeftDate.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        fundingLeftDate.leftAnchor.constraint(equalTo: self.leftAnchor, constant:16).isActive = true
//        fundingLeftDate.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fundingLeftDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:11).isActive = true
        
        successPercent.topAnchor.constraint(equalTo: self.topAnchor, constant:11).isActive = true
//        successPercent.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        successPercent.rightAnchor.constraint(equalTo: self.rightAnchor, constant:16).isActive = true
//        successPercent.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}

class MyFundingStatusVC3: UIViewController {

    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRecognizer.direction = .down
        
        self.view.backgroundColor = .gray
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
    }

    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            // not generate case
        } else if sender.direction == .down {
            print("down(pop)")
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.easeInOut)
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
}

extension MyFundingStatusVC3: UICollectionViewDataSource {

    //컬렉션뷰의 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // 서버에서 주는 전부
    }
    
    //셀 참조 값 가져오기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        return cell
    }
}

extension MyFundingStatusVC3: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MyFundingStatusVC3: UICollectionViewDelegateFlowLayout {
    
    //셀크기
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
    }
    
    //위아래 간격
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    //좌우 간격
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
