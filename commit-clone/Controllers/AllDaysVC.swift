//
//  AllDaysVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class AllDaysVC: UIViewController {
//    lazy var allDaysView = AllDaysView()
    
//    override func loadView() {
//        self.view = allDaysView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftBarButton()
        setupRightBarButton()
    }
    
    private func setupLeftBarButton() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.circle"), style: .plain, target: self, action: #selector(handleLeftBarButton))
        leftBarButton.tintColor = .white
    
        self.tabBarController?.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func setupRightBarButton() {
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(handleRightBarButton))
        rightBarButton.tintColor = .white
    
        self.tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc private func handleLeftBarButton() {
        
    }
    
    @objc private func handleRightBarButton() {
        
    }
}
