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

    func getChart(_ chartVC: ChartViewController) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics?type=1", method: .get)
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
                        chartVC.topDate.text = chartResponse.result?.date.date
                        chartVC.TopCollectionView.reloadData()
                        
                        
                        print("success")
                        
                    } else {
                        
                        print("왜안돼")
                    }
                case .failure:
                    
                    print("networking fail")
                }
            })
    }
    
    func getLocalChart(_ chartVC: ChartViewController) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics?type=3", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<localResponse>) in
                switch response.result {
                case .success(let localResponse):
                    if localResponse.code == 100 {
                        
                        let localChart:[localMusic] = (localResponse.result?.music)!

                        chartVC.localChart.append(contentsOf: localChart)
                        chartVC.localDate.text = localResponse.result?.date.date
                        chartVC.LocalCollectionView.reloadData()
                        
                        
                        print("success")
                        
                    } else {
                        
                        print("왜안돼")
                    }
                case .failure:
                    
                    print("networking fail")
                }
            })
    }
    
    func getBillboardChart(_ chartVC: ChartViewController) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics?type=2", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<billboardResponse>) in
                switch response.result {
                case .success(let billboardResponse):
                    if billboardResponse.code == 100 {
                        
                        let billboardChart:[billboardMusic] = (billboardResponse.result?.music)!

                        chartVC.billboardChart.append(contentsOf: billboardChart)
                        chartVC.billboardDate.text = billboardResponse.result?.date.data
                        chartVC.BillboardCollectionView.reloadData()
                        
                        
                        print("success")
                        
                    } else {
                        
                        print("왜안돼")
                    }
                case .failure:
                    
                    print("networking fail")
                }
            })
    }
    
    func getGlobalChart(_ chartVC: ChartViewController) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/musics?type=4", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<globalResponse>) in
                switch response.result {
                case .success(let globalResponse):
                    if globalResponse.code == 100 {
                        
                        let globalChart:[globalMusic] = (globalResponse.result?.music)!

                        chartVC.globalChart.append(contentsOf: globalChart)
                        chartVC.globalDate.text = globalResponse.result?.date.date
                        chartVC.GlobalCollectionView.reloadData()
                        
                        
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
