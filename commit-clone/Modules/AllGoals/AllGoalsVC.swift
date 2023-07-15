//
//  AllGoalsVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

class AllGoalsVC: GenericVC<AllGoalsView> & Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBarButtons()
    }
    
    private func setupBarButtons() {
//        self.tabBarController?.navigationItem.leftBarButtonItem = rootView.leftBarButton
//        self.tabBarController?.navigationItem.rightBarButtonItem = rootView.rightBarButton
        navigationItem.leftBarButtonItem = rootView.leftBarButton
        navigationItem.rightBarButtonItem = rootView.rightBarButton
        
        rootView.leftBarButton.target = self
        rootView.leftBarButton.action = #selector(backTapped)
        
        rootView.rightBarButton.target = self
        rootView.rightBarButton.action = #selector(editTapped)
    }
    
    @objc private func backTapped() {
        coordinator?.popVC()
    }
    
    @objc private func editTapped() {
        
    }

}
