//
//  CustomMenuBarCell.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

/**
 1) 어떻게 첫 번째랑 두 번째 text 다르게 할 지 생각하기
 */

/**
커스텀 탭바를 위한 몸부림2
*/

import UIKit

class CustomMenuBarCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Tab" // 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.addSubview(label)
//        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    }
}
