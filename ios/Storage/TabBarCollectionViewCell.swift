//
//  tabBarCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/21.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
    
//    static let reuseIdentifier = "TabBarCell"
        @IBOutlet weak var titleLabel: UILabel!
        
        func setTitle(title: String) {
            titleLabel.text = title
        }
        
        override var isSelected: Bool {
            willSet {
                if newValue {
                    titleLabel.textColor = .black
                } else {
                    titleLabel.textColor = .lightGray
                }
            }
        }
        
        override func prepareForReuse() {
            isSelected = false
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
}

    

