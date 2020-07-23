//
//  NewsCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/21.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var NewsImageView: UIImageView!
    @IBOutlet weak var NewsTitleLabel: UILabel!
    @IBOutlet weak var NewsLookLabel: UILabel!
    @IBOutlet weak var NewsPlayButton: UIButton!
    @IBOutlet weak var NewsPlayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
