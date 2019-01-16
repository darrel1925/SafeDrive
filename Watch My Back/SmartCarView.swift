//
//  SmartCarView.swift
//  Watch My Back
//
//  Created by Darrel Muonekwu on 1/12/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
/* https://storage.googleapis.com/sbhax/plate.jpg */

import UIKit
import WebKit


class SmartCarView: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var notifiedLabel: UILabel!
    @IBOutlet weak var returnOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://storage.googleapis.com/sbhax/plate.jpg")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.notifiedLabel.alpha = 1
            self.returnOutlet.alpha = 1
            
        })
    }
}
