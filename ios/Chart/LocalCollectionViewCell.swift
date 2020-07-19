//
//  LocalCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/19.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LocalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var LocalImageView: UIImageView!
    @IBOutlet weak var LocalRankLabel: UILabel!
    @IBOutlet weak var LocalTitleLabel: UILabel!
    @IBOutlet weak var LocalSubTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
