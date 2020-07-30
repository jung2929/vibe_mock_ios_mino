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

    func getChart(_ chartVC: ChartViewController, type:Int) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics?type=\(type)", method: .get)
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
                        chartVC.topDate.text = chartResponse.result?.date.date
                        
                        
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
