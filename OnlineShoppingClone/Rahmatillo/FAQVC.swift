//
//  FAQVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit
import WebKit

class FAQVC: UIViewController, UIWebViewDelegate, WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        webView.navigationDelegate = self
        
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }

     
    
  


}

