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
class LocalDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func getChart(_ chartVC: ChartViewController, page:Int) {
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)interior-country-growth?page=\(page)", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<localResponse>) in
                switch response.result {
                case .success(let localResponse):
                    if localResponse.code == 100 {
                        

                        
                        
                        
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
