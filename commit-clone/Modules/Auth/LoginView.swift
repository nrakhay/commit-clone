//
//  LoginView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 18.07.2023.
//

import UIKit
import GoogleSignIn
import Firebase

protocol LoginViewDelegate {
    func loginButtonPressed()
}

class LoginView: UIView {
    var delegate: LoginViewDelegate?
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont(name: "CalSans-SemiBold", size: 42)
        label.textColor = .white
        
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login with Google", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(named: "accent-color"), for: .normal)
        button.setImage(UIImage(named: "google-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 12
        return button
    }()
    
    
    @objc private func loginPressed() {
        delegate?.loginButtonPressed()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(named: "background-color")
        addSubviews(loginLabel, loginButton)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        loginLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingLeft: 20)
        loginButton.center(in: self, in: self, width: self.width * 0.6, height: 50)
    }
}
