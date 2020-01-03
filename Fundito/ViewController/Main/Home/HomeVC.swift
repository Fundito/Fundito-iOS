//
//  HomeVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

// searchTextField ketboard
class HomeVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    @IBOutlet weak var noticeBtn: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var connectedView: UIView!
    @IBOutlet weak var connectedViewLabel: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeWiFi: UILabel!
    @IBOutlet weak var leftDaysLabel: UILabel!
    @IBOutlet weak var leftDays: UILabel!
    @IBOutlet weak var timeLineLabel: UILabel!
    @IBOutlet weak var fundingProgressView: FundingProgressView!

    @IBOutlet weak var timelineCollectionView: UICollectionView!

    @IBAction func noticeBtnAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeNotificationVC") as! HomeNotificationVC
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}

// MARK: Lifecycle
extension HomeVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        self.navigationController?.isNavigationBarHidden = true
        searchTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: Initialization
extension HomeVC{
    private func initView(){
        setNavigation()
        setupTextField(textField: searchTextField)
        setupLabel()
        setupImageView(image: storeImage)
        setupView(view: connectedView)
        setupProgressVIew(view: fundingProgressView)
        setupConllectionView()
    }
    
    private func setNavigation(){
        
        backBtn.image = UIImage(named: "backarrowNavyIcon")
        backBtn.tintColor = UIColor.darkNavy
    }
    
    private func setupTextField( textField: UITextField){

        // searchView 에 색깔 넣어서 radius 구현
        // tip : 섀도우와 cornerRadius는 동시에 코드로 둥글게 불가 !
        searchView.frame.size.height = 37
        searchView.backgroundColor = UIColor.init(displayP3Red: 235.0/255.0, green: 236.0/255.0, blue: 237.0/255.0, alpha: 1)
        searchView.cornerRadius = 19
        
        // textField.cornerRadius = 19
        textField.clipsToBounds = false
        
        // Textfield 높이
        textField.frame.size.height = 37
        
        // Textfield 배경색
        textField.backgroundColor = .clear
        // TextField border
        textField.borderStyle = .none
        textField.borderColor = UIColor.init(displayP3Red: 235.0/255.0, green: 236.0/255.0, blue: 237.0/255.0, alpha: 1)
        
        
        // placeholder 글씨체
        textField.attributedPlaceholder = .init(string: textField.placeholder ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.greyish
        ])
        
        // placeholder padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 37))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    private func setupLabel(){
        // welcomeLabel
        let attributedString = NSMutableAttributedString(string: "홍지원님,\n식사는 잘 하셨나요?", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Light", size: 24.0)!,
          .foregroundColor: UIColor.darkNavy
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Regular", size: 24.0)!, range: NSRange(location: 0, length: 3))
        
        welcomeLabel.attributedText = attributedString
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.numberOfLines = 2
        
        // connectedViewLabel
        setupText(label: connectedViewLabel, fontName: "SpoqaHanSans-Bold", size: 12.0, color: .darkNavy)
        // storeName
        setupText(label: storeName, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        // storeWiFi
        setupText(label: storeWiFi, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .black)
        // leftDaysLabel
        setupText(label: leftDaysLabel, fontName: "SpoqaHanSans-Bold", size: 12.0, color: .charcoalGrey)
        // leftDays
        setupText(label: leftDays, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .charcoalGrey)
        // timeLineLabel
        setupText(label: timeLineLabel, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .charcoalGrey)
    }
    
    private func setupImageView( image: UIImageView){
        // storeImage
        storeImage.cornerRadius = storeImage.frame.size.height/2
    }
    
    func setupView(view: UIView){
        // connectedView
        // radius 8
        view.cornerRadius = 8
        // opacity 68
        view.backgroundColor = UIColor(white: 1, alpha: 0.68)
        // border pinkishGrey 1pt inside
        view.borderColor = .pinkishGrey
        view.borderWidth = 1
        // shadow blur 18
        view.shadowOpacity = 18
        // rgba 0,0,0, 0.08
        view.shadowColorExtension = UIColor(displayP3Red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.08)
        
        setupViewTapGesture()
    }
    
    func setupProgressVIew(view: FundingProgressView){
        view.progress = 25
        view.backgroundColor = .clear
    }
    
    private func setupConllectionView(){
        timelineCollectionView.delegate = self
        timelineCollectionView.dataSource = self

        timelineCollectionView.backgroundColor = .clear
        timelineCollectionView.borderColor = .peachyPink
        timelineCollectionView.cornerRadius = 8
        timelineCollectionView.borderWidth = 1
        timelineCollectionView.shadowColorExtension = .init(white: 0.0, alpha: 0.08)
        timelineCollectionView.shadowOpacity = 10
        
    }
    
    
    func setupViewTapGesture(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(HomeVC.goStoreDetailVC(_:)))
        self.connectedView.addGestureRecognizer(gesture)
    }
    
    @objc func goStoreDetailVC(_ sender:UIGestureRecognizer) {
        
        let storyboard = UIStoryboard(name: "Store", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoreDetailVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimelineCollectionViewCell", for: indexPath) as! TimelineCollectionViewCell

        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = timelineCollectionView.bounds.width
        let height = timelineCollectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}


extension HomeVC: UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchTextField.resignFirstResponder()
//        self.searchTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.searchTextField.resignFirstResponder()
        //            self.dismiss(animated: true, completion: nil)
        return true
    }
}
