//
//  SingleDayVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 16.07.2023.
//

import UIKit

class SingleDayVC: GenericVC<SingleDayView>, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
    }
    
    private func setupBarButton() {
        navigationItem.leftBarButtonItem = rootView.leftBarButton
        rootView.leftBarButton.target = self
        rootView.leftBarButton.action = #selector(backTapped)
    }
    
    @objc private func backTapped() {
        coordinator?.popVC()
    }
}
