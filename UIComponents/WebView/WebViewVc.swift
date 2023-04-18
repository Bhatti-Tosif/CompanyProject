//
//  WebViewVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit
import WebKit

class WebViewVc: UIViewController, WKUIDelegate {
    
    //MARK: Outlets
    @IBOutlet private weak var webView2: WKWebView!
    
    //MARK: Variable Declaration
    let webView: WKWebView = {
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        var configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preference
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)

        //MARK: WebView
        guard let url = URL(string: "https://www.flipkart.com/") else { return }
        webView.uiDelegate = self
        webView.load(URLRequest(url: url))
        //webView.allowsBackForwardNavigationGestures = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
}


