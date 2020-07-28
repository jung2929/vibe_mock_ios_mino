//
//  NewsDetailViewController.swift
//  VIBE
//
//  Created by 조민호 on 2020/07/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class NewsDetailViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string:"https://github.com/Mino777") else {return}
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func oepnSFSafariViewControllerAction(_ sender: Any) {
        guard let url = URL(string: "https://github.com/Mino777") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
     }
}
