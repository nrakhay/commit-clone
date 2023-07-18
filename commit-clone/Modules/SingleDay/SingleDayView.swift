//
//  SingleDayView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 16.07.2023.
//

import UIKit

class SingleDayView: UIView {
    struct ViewModel {
        
    }
    
    let header: UILabel = {
        let label = UILabel()
        label.text = "jun 22"
        label.font = UIFont(name: "CalSans-SemiBold", size: 42)
        label.textColor = .white
        return label
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        
        label.font = label.font.withSize(18)
        label.textColor = UIColor(named: "quote-color")
        label.numberOfLines = 0

        label.setLineSpacing(for: "Let today be the day you give up who you've been for who you can become", with: 4.0)

        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "- HORACE MANN"
        label.font = label.font.withSize(14)
        label.textColor = UIColor(named: "author-color")
        label.numberOfLines = 0
        
        return label
    }()
    
    let largeProgressBox: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "accent-color")
        view.layer.cornerRadius = 50
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.1
        return view
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(SingleDayTVCell.self, forCellReuseIdentifier: SingleDayTVCell.identifier)
        table.separatorStyle = .none
        table.backgroundColor = UIColor(named: "background-color")
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    let leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "arrow.backward.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        button.width = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews(
            header,
            quoteLabel,
            authorLabel,
            largeProgressBox,
            tableView
        )
        self.backgroundColor = UIColor(named: "background-color")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        header.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingLeft: 20)
        quoteLabel.anchor(top: header.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 25)
        authorLabel.anchor(top: quoteLabel.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 25)
        largeProgressBox.anchor(top: authorLabel.bottomAnchor, left: self.leftAnchor, paddingTop: 10, paddingLeft: 20, width: 200, height: 200)
        tableView.anchor(top: largeProgressBox.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
    }
}



