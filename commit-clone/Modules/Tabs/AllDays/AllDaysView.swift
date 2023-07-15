//
//  AllDaysView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class AllDaysView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubviews(header, collectionView)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        header.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingLeft: 15)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 40)
        
        collectionView.anchor(top: header.bottomAnchor, paddingTop: 15)
        collectionView.centerX(in: self, width: self.width - 40, height: self.height - header.height)
        collectionView.collectionViewLayout = layout
    }

    let header: UILabel = {
        let label = UILabel()
        label.text = "all days"
        label.font = UIFont(name: "CalSans-SemiBold", size: 42)
        label.textColor = .white
        return label
    }()
    
    let leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    let rightBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private func setupCollectionView() {
        collectionView.register(GridCVCell.self, forCellWithReuseIdentifier: GridCVCell.identifier)
        collectionView.backgroundColor = UIColor(named: "background-color")
        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
    }

    private func setupView() {
        self.backgroundColor = UIColor(named: "background-color")
    }
}


