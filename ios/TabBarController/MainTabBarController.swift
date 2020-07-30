//
//  MainTabBarController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit

@available(iOS 13.0, *)
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBar.barTintColor = .white
        tabBar.clipsToBounds = true
        
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
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        
        let view = MiniView(frame: self.view.frame)
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.bottomMargin.equalTo(tabBar.snp.top).offset(-5)
            make.size.equalTo(CGSize(width: 414, height: 50))
            
        }
        
        // 0, 0 위치에 너비 100 높이 50인 버튼을 구성하며 객체 생성
        
        let button1 = UIButton()
        button1.frame = CGRect.init(x: CGFloat(0), y: CGFloat(0), width: CGFloat(100), height: CGFloat(50))

        // 생성한 버튼의 타이틀을 지정
        //  - normal : 일반적인 상태에서 지정한 타이틀을 보여준다. (기본값)
        //  - highlighted : 꾹 누르고 있는 상태에서 지정된 타이틀을 보여준다.
        button1.setTitle("", for: .normal)

        // 생성한 버튼의 타이틀 폰트 사이즈를 13으로 지정한다.
        //  - systemFont : 시스템 폰트 사용 (볼드 off)
        //  - boldSystemFont : 시스템 폰트 사용 (볼드 on)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(0))

        // 생성한 버튼의 타이틀 색상을 지정한다.
        //  - normal : 일반적인 상태에서 지정한 타이틀 색을 보여준다. (기본값)
        //  - highlighted : 꾹 누르고 있는 상태에서 지정된 타이틀 색을 보여준다.
        button1.setTitleColor(UIColor.clear, for: .normal)

        // 생성한 버튼의 타이틀의 정렬을 지정한다.
        //  - center : 가운데 정렬
        //  - left : 왼쪽 정렬
        //  - right : 오른쪽 정렬
        button1.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left

        // 생성한 버튼의 이벤트를 지정한다.
        button1.addTarget(self, action: #selector(self.TESTAction), for: .touchUpInside)

        self.view.addSubview(button1)
        
        button1.snp.makeConstraints { make in
            make.bottomMargin.equalTo(tabBar.snp.top).offset(-5)
            make.size.equalTo(CGSize(width: 200, height: 50))
            
        }
        
        

        
        
//        instantiateFromNib()
        

//      let miniPlayerViewController = MiniPlayerViewController(nibName: "MiniPlayerViewController", bundle: nil)
//        miniPlayerViewController.modalPresentationStyle = .fullScreen
//
//      self.present(miniPlayerViewController, animated: true, completion: nil)

        

    }
    
    // 버튼 클릭 시 동작할 이벤트 함수
    @objc func TESTAction(sender: UIButton!) {
        let musicPlayerViewController = MusicPlayerViewController(nibName: "MusicPlayerViewController", bundle: nil)
        self.present(musicPlayerViewController, animated: true, completion: nil)
    }
    
    
    
//    func instantiateFromNib() -> MiniPlayerViewController {
//        let nib = UINib(nibName: "MiniPlayerViewController", bundle: nil)
//        let vc = nib.instantiate(withOwner: nil, options: nil).first as! MiniPlayerViewController
//        return vc
//    }

}

