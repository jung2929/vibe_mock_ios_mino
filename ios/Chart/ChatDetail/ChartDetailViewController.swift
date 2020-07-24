//
//  ChartDetailViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ChartDetailViewController: UIViewController {

    @IBOutlet weak var chartTableView: UITableView!
    
    var data:[String] = ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10", "test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    let rankData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "오늘 Top 100"

        
        chartTableView.delegate = self
        chartTableView.dataSource = self
        
        let nibName = UINib(nibName: "ChartDetailTableViewCell", bundle: nil)
        chartTableView.register(nibName, forCellReuseIdentifier: "cell")

    }

}

extension ChartDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChartDetailTableViewCell

        cell.chartDetailTitleLabel.text = data[indexPath.row]
        cell.chartDetailImageView.image = UIImage(named: "recently_test2")
        cell.chartDetailRankLabel.text = rankData[indexPath.row]
        cell.chartDetailArtistName.text = data[indexPath.row]

        return cell

    }
}
