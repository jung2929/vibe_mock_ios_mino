//
//  MiniPlayerViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MiniPlayerViewController: UIViewController {

    @IBOutlet weak var MiniPlayerImageView: UIImageView!
    @IBOutlet weak var MiniPlayerTitleLabel: UILabel!
    @IBOutlet weak var MiniPlayerArtistName: UILabel!
    @IBOutlet weak var MiniPlayerPlayButton: UIButton!
    @IBOutlet weak var MiniPlayerForwardButton: UIButton!
    @IBOutlet weak var MiniPlayerPlayListButton: UIButton!
    @IBOutlet weak var MiniPlayerPresentModalButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func instanceFromNib() -> UIView {
        return UINib(nibName: "MiniViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
