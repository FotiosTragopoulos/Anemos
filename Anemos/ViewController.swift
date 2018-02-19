//
//  ViewController.swift
//  Anemos
//
//  Created by Fotios Tragopoulos on 01/02/2018.
//  Copyright © 2018 Fotios Tragopoulos. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var frontButton: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    var timeBool: Bool!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url: URL = URL(string: "https://duckduckgo.com")!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func frontButtonTapped(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func searchPage(_ sender: Any) {
        viewDidAppear(true)
    }
    
    @IBAction func reloadPage(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func stopLoading(_ sender: Any) {
        webView.stopLoading()
        progressBar.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        frontButton.isEnabled = webView.canGoForward
        progressBar.isHidden = false
        progressBar.progress = 0.0
        timeBool = false
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(ViewController.timerCallBack), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallBack() {
        if timeBool != nil {
            if progressBar.progress >= 1 {
                progressBar.isHidden = true
                timer.invalidate()
            } else {
                progressBar.progress += 0.1
            }
        } else {
            progressBar.progress += 0.01
            if progressBar.progress >= 0.95 {
                progressBar.progress = 0.95
            }
        }
    }
}

