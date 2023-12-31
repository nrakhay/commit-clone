//
//  AllGoalsVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

protocol AllHabitsVCProtocol {
    var onBackTapped: Callback? { get set }
}

class AllHabitsVC: GenericVC<AllHabitsView>, AllHabitsVCProtocol {
    var onBackTapped: Callback?
    
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
        self.onBackTapped?()
    }
    
    @objc private func editTapped() {

    }

}
