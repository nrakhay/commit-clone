//
//  AllDaysView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

//import UIKit
//
//class AllDaysView: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupView() {
//        self.backgroundColor = UIColor(named: "background-color")
//        setupLeftBarButton()
//        setupRightBarButton()
//    }
//
//    private func setupLeftBarButton() {
//        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.circle"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
//        leftBarButton.tintColor = .white
//
//        self.navigationItem.leftBarButtonItem = leftBarButton
//    }
//
//    private func setupRightBarButton() {
//        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
//        rightBarButton.tintColor = .white
//
//        self.navigationItem.rightBarButtonItem = rightBarButton
//    }
//
//    @objc private func leftBarButtonTapped() {
//
//    }
//
//    @objc private func rightBarButtonTapped() {
//
//    }
//}
