//
//  SettingsView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

protocol SettingsViewDelegate {
    func logoutTapped()
}

class SettingsView: UIView {
    var delegate: SettingsViewDelegate?
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "settings"
        label.font = UIFont(name: "CalSans-SemiBold", size: 42)
        label.textColor = .white
        
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log out", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderColor = UIColor.red.cgColor.copy(alpha: 0.5)
        button.layer.borderWidth = 2
        return button
    }()
    
    @objc private func logoutTapped() {
        delegate?.logoutTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(named: "background-color")
        addSubviews(settingsLabel, logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        settingsLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingLeft: 20)
        logoutButton.centerX(in: self, width: 0.9 * self.width, height: 50)
        logoutButton.anchor(top: settingsLabel.bottomAnchor, paddingTop: 10)
    }
    
}
