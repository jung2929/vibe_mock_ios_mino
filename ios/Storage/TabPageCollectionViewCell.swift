//
//  tabPageCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/21.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class TabPageCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "TabPageCell"
    lazy var backColor: [UIColor] = [.lightGray, .purple, .orange, .cyan, .magenta, .lightGray, .purple, .orange]
    
    func setColor(index: Int){
        self.backgroundColor = backColor[index]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
