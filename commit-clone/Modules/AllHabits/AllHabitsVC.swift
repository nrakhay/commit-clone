//
//  AllGoalsVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

class AllHabitsVC: GenericVC<AllHabitsView> & Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBarButtons()
    }
    
    private func setupBarButtons() {
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
