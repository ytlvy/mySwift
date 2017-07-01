//
//  ViewController.swift
//  mySwift
//
//  Created by zyn on 2017/7/1.
//  Copyright © 2017年 ytlvy.com. All rights reserved.
//

import UIKit

func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {
    
    lazy var loginButton: UIButton = self.initialLoginButton()
    var heading: UILabel!
    var username: UITextField!
    var password: UITextField!
    
    var cloud1: UIImageView!
    var cloud2: UIImageView!
    var cloud3: UIImageView!
    var cloud4: UIImageView!
    
    // MARK: -  further UI
    let spnner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
    
    var statusPosition = CGPoint.zero
    
    // MARK: - view LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.loginButton)
        
        
    }

    override func viewWillLayoutSubviews() {
        self.loginButton.anchor(in: .topLeft, xPad: 10, yPad: 66+10, width: 80, height: 40);
    }
    
    // MARK: - IBActions
    @objc
    func loginHandle(sender: UIButton) {
        print("login clicked")
    }
    
    // MARK: - Properties
    func initialLoginButton() -> UIButton {
        let loginButton = UIButton.init(type: .custom)
        loginButton.setTitle("login", for: .normal)
        loginButton.setTitleColor(.brown, for: .normal)
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(self.loginHandle), for: .touchUpInside)
        return loginButton
    }
    
    func initialHeading() -> UILabel {
        let headingLabel = UILabel.init()
        headingLabel.text = "I made a label on the screen #toogood4you"
        headingLabel.font = UIFont(name: "MarkerFelt-Thin", size: 45)
        headingLabel.textColor = UIColor.red
        headingLabel.textAlignment = .center
        headingLabel.numberOfLines = 1
        return headingLabel
    }
}

