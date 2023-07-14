//
//  GridCVCell.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 12.07.2023.
//

import UIKit

class GridCVCell: UICollectionViewCell {
    static let identifier = "GridCVCell"
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "accent-color")
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.1
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
