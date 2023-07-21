//
//  DayButton.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 20.07.2023.
//

import UIKit

class DayButton: UIButton {
    enum State {
        case active
        case inactive
    }
    
    var buttonState: State? {
        didSet {
            handleButtonState(state: buttonState)
        }
    }
    
    var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    private func handleButtonState(state: State?) {
        guard let state = state else { return }
        
        switch state {
        case .active:
            self.setTitleColor(.white, for: .normal)
            self.layer.borderColor = UIColor.white.cgColor
        case .inactive:
            self.setTitleColor(.gray, for: .normal)
            self.layer.borderColor = UIColor.gray.cgColor
        }
        
    }
    
    private func setupButton() {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        handleButtonState(state: self.buttonState)
    }
    
    init(state: State? = nil, title: String? = nil, tintColor: UIColor? = nil, backgroundColor: UIColor? = nil) {
        super.init(frame: .zero)
        
        self.title = title
        self.buttonState = state
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.anchor(height: 50)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
