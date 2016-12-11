//  ViewController.swift
//  Anemos
//  Created by Fotios Tragopoulos on 10/12/2016.
//  Copyright © 2016 Fotios Tragopoulos. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://duckduckgo.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func searchPage(_ sender: Any) {
        let url = URL(string: "https://duckduckgo.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

}
