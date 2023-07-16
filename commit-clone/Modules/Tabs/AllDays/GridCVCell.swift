//
//  GridCVCell.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 12.07.2023.
//

import UIKit

class GridCVCell: UICollectionViewCell {
    static let identifier = "GridCVCell"
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "accent-color")
        view.layer.cornerRadius = 13
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.isUserInteractionEnabled = true
        contentView.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
