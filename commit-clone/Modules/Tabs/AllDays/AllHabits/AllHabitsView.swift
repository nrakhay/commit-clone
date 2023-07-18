//
//  AllGoalsView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

class AllHabitsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews(header)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        header.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingLeft: 15)
    }
    
    let header: UILabel = {
        let label = UILabel()
        label.text = "habits"
        label.font = UIFont(name: "CalSans-SemiBold", size: 42)
        label.textColor = .white
        return label
    }()
    
    let leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "arrow.backward.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    let rightBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "background-color")
    }
    
}
