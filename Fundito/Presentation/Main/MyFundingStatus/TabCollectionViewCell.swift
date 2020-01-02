//
//  TabCollectionViewCell.swift
//  Fundito
//
//  Created by kimhyeji on 12/27/19.
//  Copyright © 2019 Fundito. All rights reserved.
//


import UIKit

class TabCollectionViewCell: UICollectionViewCell{

    static var identifier: String = "TabCollectionViewCell"
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var leftDays: UILabel!
    @IBOutlet weak var successRate: UILabel!
    @IBOutlet weak var fundingProgressView: FundingProgressView!
    
    
}
//
//    //부모 메서드 초기화 시켜줘야 한다.
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    var storeName: UILabel = {
//        let storeName = UILabel()
//        storeName.text = "#가게이름"
//        storeName.textColor = .black
//        storeName.textAlignment = .center
//        storeName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        storeName.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
//        return storeName
//    }()
//
//    var fundingLeftDate: UILabel = {
//        let fundingLeftDate = UILabel()
//        fundingLeftDate.text = "#duedate-today"+"일 남음"
//        fundingLeftDate.textColor = .black
//        fundingLeftDate.textAlignment = .center
//        fundingLeftDate.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        fundingLeftDate.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
//        return fundingLeftDate
//    }()
//
//    var successPercent: UILabel = {
//        let successPercent = UILabel()
//        successPercent.text = "#percent계산"+"달성중"
//        successPercent.textColor = .black
//        successPercent.textAlignment = .center
//        successPercent.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        successPercent.translatesAutoresizingMaskIntoConstraints = false // 자동으로 위치 정렬 금지
//        return successPercent
//    }()
//
//    func setupView(){
//        backgroundColor = .white
//
//        // 셀에 레이블 추가
//        self.contentView.addSubview(storeName)
//        self.contentView.addSubview(fundingLeftDate)
//        self.contentView.addSubview(successPercent)
//
//        //제약조건 설정하기
//        storeName.topAnchor.constraint(equalTo: self.topAnchor, constant:11).isActive = true
//        storeName.leftAnchor.constraint(equalTo: self.leftAnchor, constant:16).isActive = true
////        storeName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
////        storeName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        //storeName.widthAnchor.constraint(equalToConstant: 0).isActive = true
//        //storeName.heightAnchor.constraint(equalToConstant: 0).isActive = true
//
////        fundingLeftDate.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        fundingLeftDate.leftAnchor.constraint(equalTo: self.leftAnchor, constant:16).isActive = true
////        fundingLeftDate.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        fundingLeftDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:11).isActive = true
//
//        successPercent.topAnchor.constraint(equalTo: self.topAnchor, constant:11).isActive = true
////        successPercent.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        successPercent.rightAnchor.constraint(equalTo: self.rightAnchor, constant:16).isActive = true
////        successPercent.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
//    }
//}
//
