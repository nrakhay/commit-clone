//
//  SingleDayTVCell.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 17.07.2023.
//

import UIKit

class SingleDayTVCell: UITableViewCell {
    static let identifier = "SingleDayTVCell"
    static let preferredHeight: CGFloat = 60
    
    struct ViewModel {
        let habitName: String
    }
    
    private var isChecked: Bool = false
    
    let checkboxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "accent-color")
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.1
        return button
    }()
    
    let habitLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.textColor = .white
        return label
    }()
    
    @objc private func buttonClicked() {
        if isChecked {
            checkboxButton.backgroundColor = UIColor(named: "accent-color")
        } else {
            checkboxButton.backgroundColor = UIColor(named: "completed-green")
        }
        
        isChecked = !isChecked
    }
    
    func configure(with viewModel: ViewModel) {
        habitLabel.text = viewModel.habitName
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(named: "background-color")
        
        addSubviews(checkboxButton, habitLabel)
        checkboxButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        habitLabel.text = nil
        checkboxButton.backgroundColor = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkboxButton.centerY(in: self, left: self.leftAnchor, paddingLeft: 10, width: 40, height: 40)
        habitLabel.centerY(in: self)
        habitLabel.anchor(left: checkboxButton.rightAnchor, paddingLeft: 15)
    }
}
