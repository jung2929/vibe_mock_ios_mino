//
//  RecentlyCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/19.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class RecentlyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var RecentlyImageView: UIImageView!
    @IBOutlet weak var RecentlyTitleLabel: UILabel!
    @IBOutlet weak var RecentlySubTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Initialization code
    }
//
//
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        setNeedsLayout()
//        layoutIfNeeded()
//        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        var newFrame = layoutAttributes.frame
//        newFrame.size.height = ceil(size.height)
//        newFrame.size.width = UIScreen.main.bounds.width / 2
//        layoutAttributes.frame = newFrame
//        return layoutAttributes
//    }
}
