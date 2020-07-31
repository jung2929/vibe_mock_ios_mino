//
//  ChartDetailViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ChartDetailViewController: UIViewController {

    @IBOutlet weak var chartTableView: UITableView!
    @IBAction func playButton(_ sender: Any) {
        let musicPlayerViewController = MusicPlayerViewController(nibName: "MusicPlayerViewController", bundle: nil)
        self.present(musicPlayerViewController, animated: true, completion: nil)
    }
    
    let recentData1: [String] = ["홈_4_1", "홈_4_2", "홈_4_3", "홈_4_4", "홈_4_5", "홈_4_6", "홈_4_7", "홈_4_8", "홈_4_9", "recently_test2"]
    let recentData2 = ["ROCKSTAR (Feat. Roddy Ricch)", "다시 여기 바닷가", "MARGARITA (Feat. 재규어 중사)", "One More Night", "일기", "내꺼하자", "Mama Told Me", "Physical (Feat. 화사)", "Between Us (Feat. Snoh Aalegra)", "빗소리"]
    let recentData3 = ["DaBaby", "싹쓰리(유두래곤, 린다G, 비룡)", "KIRIN (기린)", "Maroon 5", "박소은", "원어스(ONEUS)", "Alex Newell", "Dua Lipa, 화사(Hwa Sa)", "dvsn", "산들" ]
    let rankData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.topItem?.title = "오늘 Top 100"

        
        chartTableView.delegate = self
        chartTableView.dataSource = self
        
        let nibName = UINib(nibName: "ChartDetailTableViewCell", bundle: nil)
        chartTableView.register(nibName, forCellReuseIdentifier: "cell")

    }

}

@available(iOS 13.0, *)
extension ChartDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentData1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChartDetailTableViewCell

        cell.chartDetailTitleLabel.text = recentData2[indexPath.row]
        cell.chartDetailImageView.image = UIImage(named: recentData1[indexPath.row])
        cell.chartDetailRankLabel.text = rankData[indexPath.row]
        cell.chartDetailArtistName.text = recentData3[indexPath.row]

        return cell

    }
    
}
