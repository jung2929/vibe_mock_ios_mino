//
//  StorageViewController.swift
//  ios
//
//  Created by 조민호 on 2020/07/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

@available(iOS 13.0, *)
class StorageViewController: TabmanViewController {
    
    private var views = [SongViewController(),SongViewController(), SongViewController(), SongViewController(), SongViewController(), SongViewController(), SongViewController(), SongViewController() ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 80, left: 20,  bottom: 0, right: 0)
        bar.layout.alignment = .leading
        bar.backgroundView.style = .clear
        // Add to view
        bar.tintColor = UIColor.black
        bar.buttons.customize{(button) in
            button.selectedTintColor = .black
            button.tintColor = .lightGray
        }
        bar.indicator.tintColor = .red
        bar.indicator.weight = .light
        addBar(bar, dataSource: self, at: .top)
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        
    }

    
}
@available(iOS 13.0, *)
extension StorageViewController : PageboyViewControllerDataSource , TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return views.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return views[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: 0)
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        var title = ""
        if index == 0 {
            title = "노래"
        }else if index == 1 {
            title = "아티스트"
        }else if index == 2 {
            title = "앨범"
        }else if index == 3 {
            title = "플레이리스트"
        }else if index == 4 {
            title = "받은 노래"
        }else if index == 5 {
            title = "저장한 노래"
        }else if index == 6 {
            title = "저장한 앨범"
        }else if index == 7 {
            title = "저장한 플레이리스트"
        }
        
        
        return TMBarItem(title: title)
    }
}

