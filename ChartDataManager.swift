//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.


import Alamofire
import AlamofireObjectMapper
import AlamofireImage
import Kingfisher

@available(iOS 13.0, *)
class ChartDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getChart(_ chartVC: ChartViewController, page:Int) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/today-top-music-list?page=\(page)", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<chartResponse>) in
                switch response.result {
                case .success(let chartResponse):
                    if chartResponse.code == 100 {
                        
//                        musicPlayerVC.thumbnailImageView.kf.setImage(with: url)
                        
                        let topChart:[Music] = (chartResponse.result?.music)!
//                        let topImageFromData = chartResponse.result?.music?[10].albumImage
//                        let topImageUrl = URL(string: topImageFromData!)
//                        chartVC.imageUrl = topImageUrl!
                        chartVC.topChart.append(contentsOf: topChart)
                        chartVC.TopCollectionView.reloadData()
                        chartVC.topDate.text = chartResponse.result?.date.data
                        
                        
                        print("success")
                        
                    } else {
                        
                        print("왜안돼")
                    }
                case .failure:
                    
                    print("networking fail")
                }
            })
    }
    
    
    
}
