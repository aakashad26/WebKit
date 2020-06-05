//
//  ViewController.swift
//  WebKitView
//
//  Created by Aakash Adhikari on 5/21/20.
//  Copyright © 2020 Aakash Adhikari. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.navigationDelegate = self
        activityIndicator.startAnimating()
        
        textField.delegate = self
        webView.navigationDelegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
        let urlString:String = "https://www.apple.com"
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        textField.text = urlString
        

    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        if webView.canGoBack {
            
            webView.goBack()
            
        }
        
    }
    
    @IBAction func forwadPressed(_ sender: Any) {
        
        if webView.canGoForward {
            
            webView.goForward()
            
        }
        
    }
    
    func textFieldPressed(_ sender: String) {
        
        
    }
    
    
    
}

extension ViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
        textField.text = webView.url?.absoluteString
        
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString:String = textField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }
    
}

