//
//  BillboardCollectionViewCell.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/19.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class BillboardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var BillImageView: UIImageView!
    @IBOutlet weak var BillRankLabel: UILabel!
    @IBOutlet weak var BillTitleLabel: UILabel!
    @IBOutlet weak var BillSubTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
