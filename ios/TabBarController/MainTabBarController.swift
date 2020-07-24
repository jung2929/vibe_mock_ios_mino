//
//  MainTabBarController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBar.barTintColor = .white
        tabBar.clipsToBounds = true
        
                
        let home = HomeViewController()
        let chart = ChartViewController()
        let dj = DJViewController()
        let search = SearchViewController()
        let storage = StorageViewController()
        

        let icon1 = UITabBarItem(title: nil, image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home_selected"))
        let icon2 = UITabBarItem(title: nil, image: UIImage(named: "Chart"), selectedImage: UIImage(named: "Chart_selected"))
        let icon3 = UITabBarItem(title: nil, image: UIImage(named: "Dj"), selectedImage: UIImage(named: "Dj_selected")) 
        let icon4 = UITabBarItem(title: nil, image: UIImage(named: "Search"), selectedImage: UIImage(named: "Search_selected"))
        let icon5 = UITabBarItem(title: nil, image: UIImage(named: "Storage"), selectedImage: UIImage(named: "Storage_selected"))

        home.tabBarItem = icon1
        chart.tabBarItem = icon2
        dj.tabBarItem = icon3
        search.tabBarItem = icon4
        storage.tabBarItem = icon5
        let controllers = [home,chart,dj,search,storage]
        self.viewControllers = controllers

        
        // todo
        // 바이브 앱처럼 탭바 아이템들 y값 정 가운데로 정렬 가능한지 찾아보고 적용시키기
        // 위에 망할 네비게이션 바 없애기
    }

}
