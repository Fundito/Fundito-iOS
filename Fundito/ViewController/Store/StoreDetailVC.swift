//
//  StoreVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class StoreDetailVC : UIViewController{
	
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var leftDays: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var goalMoneyRate: UILabel!
    @IBOutlet weak var goalMoney: UILabel!
    @IBOutlet weak var fundingProgressView: FundingProgressView!
    @IBOutlet weak var returnRateLabel: UILabel!
    @IBOutlet weak var infomationBtn: UIButton! // 스토리보드에 이미지뷰로 되어있음
    @IBOutlet weak var returnRate: UIImageView!
    @IBOutlet weak var timelineLabel: UILabel!
    @IBOutlet weak var timelineCollectionView: UICollectionView!
    
    @IBOutlet weak var storeMenuView: UIView!
    
    @IBOutlet weak var storeMenuLabel: UILabel!
    
    @IBOutlet weak var storeMenuName1: UILabel!
    @IBOutlet weak var storeMenuName2: UILabel!
    @IBOutlet weak var storeMenuName3: UILabel!
    
    @IBOutlet weak var storeMenuPrice1: UILabel!
    @IBOutlet weak var storeMenuPrice2: UILabel!
    @IBOutlet weak var storeMenuPrice3: UILabel!
    
    @IBOutlet weak var storeInfoView: UIView!
    
    @IBOutlet weak var storeInfoLabel: UILabel!
    
    @IBOutlet weak var storeInfoName1: UILabel!
    @IBOutlet weak var storeInfoName2: UILabel!
    @IBOutlet weak var storeInfoName3: UILabel!
    
    @IBOutlet weak var storeInfoPrice1: UILabel!
    @IBOutlet weak var storeInfoPrice2: UILabel!
    @IBOutlet weak var storeInfoPrice3: UILabel!
    
    
    @IBOutlet weak var fundingBtn: UIButton!
    @IBOutlet weak var cheerBtn: UIButton!
    
    var timelineList: [Timeline] = []
    
    @IBAction func backBtnAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func fundingBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Funding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FundingInputVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func cheerBtnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Store", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoreCheerVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func unwindToThis(_ segue: UIStoryboardSegue) {
    
    }
        
}

// MARK: Lifecycle
extension StoreDetailVC{
	override func viewDidLoad() {
		super.viewDidLoad()
        
        initView()
        setTimelineData()

        timelineCollectionView.delegate = self
        timelineCollectionView.dataSource = self

        timelineCollectionView.reloadData()
        
	}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
}
// MARK: Initialization
extension StoreDetailVC{
	private func initView(){
        setBackBtn()
		setupLabel()
        setupStoreMenuView()
        setupStoreInfoView()
        setBtn()
	}
    
    
    private func setBackBtn() {
        backBtn.image = UIImage(named: "backarrowNavyIcon")
        backBtn.tintColor = UIColor.darkNavy
    }
    
    private func setupLabel() {
        
        setupText(label: storeName, fontName: "SpoqaHanSans-Bold", size: 24.0, color: .black)
        setupText(label: leftDays, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        setupText(label: dueDate, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .charcoalGrey)

        let attributedString = NSMutableAttributedString(string: "목표금액 83%  달성 중", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])

        attributedString.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!, range: NSRange(location: 4, length: 6))

        goalMoneyRate.attributedText = attributedString

//        setupText(label: goalMoneyRate, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)

        setupText(label: goalMoney, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .charcoalGrey)

        let attributedString2 = NSMutableAttributedString(string: "지금 투자 하면  175 % 환급!", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        attributedString2.addAttributes([
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!,
          .foregroundColor: UIColor.blueberry
        ], range: NSRange(location: 10, length: 5))

        returnRateLabel.attributedText = attributedString2

//        setupText(label: returnRateLabel, fontName: String, size: CGFloat, color: UIColor)
        setupText(label: timelineLabel, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
    }

    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }

    
    func setupStoreMenuView() {

        storeMenuView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.08).cgColor
        storeMenuView.layer.shadowOpacity = 0.1
        
        setupText(label: storeMenuLabel, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        setupText(label: storeMenuName1, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeMenuName2, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeMenuName3, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeMenuPrice1, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeMenuPrice2, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeMenuPrice3, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
    }
    func setupStoreInfoView(){

        storeInfoView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.08).cgColor
        storeInfoView.layer.shadowOpacity = 0.1
        
        setupText(label: storeInfoLabel, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        setupText(label: storeInfoName1, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeInfoName2, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeInfoName3, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeInfoPrice1, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeInfoPrice2, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: storeInfoPrice3, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
    }
    
    func setBtn() {
        fundingBtn.backgroundColor = .darkNavy
        fundingBtn.cornerRadius = 8
        fundingBtn.shadowColorExtension = UIColor(white: 0.0, alpha: 0.24)
        fundingBtn.shadowOpacity = 10
        fundingBtn.titleLabel?.textColor = .white
        fundingBtn.titleLabel?.font =  UIFont(name: "SpoqaHanSans-Regular", size: 16)
        
        cheerBtn.backgroundColor = .darkNavy
        cheerBtn.cornerRadius = 8
        cheerBtn.shadowColorExtension = UIColor(white: 0.0, alpha: 0.24)
        cheerBtn.shadowOpacity = 10
    }
    
}

extension StoreDetailVC: UICollectionViewDelegate, UICollectionViewDataSource{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timelineList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeTimelineCollectionViewCell", for: indexPath) as! storeTimelineCollectionViewCell

        let timeline = timelineList[indexPath.row]
        
        cell.fundingMoney?.text = timeline.fundingMoney
        cell.arrowImage?.image = timeline.arrowImage
        cell.userName?.text = timeline.userName
        cell.elapsedTime?.text = timeline.elapsedTime
//        
//        cell.contentView.layer.cornerRadius = 2.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = true
//
//        cell.layer.backgroundColor = UIColor.white.cgColor
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
//        cell.layer.shadowRadius = 2.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
//        
        
        return cell
    }
}

extension StoreDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 343
        let height = 40

        return CGSize(width: width, height: height)
    }
}


extension StoreDetailVC {
    func setTimelineData() {
        
        let timeline1 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
        let timeline2 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
        let timeline3 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
        let timeline4 = Timeline(money: "1000원 투자", imageName: "uparrowImg", userName: "개똥이", elapsedName: "1분전")
    
        // 생성한 timelineList 배열에 Timeline 모델들을 저장합니다.
        timelineList = [timeline1, timeline2, timeline3, timeline4]
    }
}
