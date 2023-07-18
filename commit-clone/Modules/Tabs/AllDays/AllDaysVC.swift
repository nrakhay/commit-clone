//
//  AllDaysVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class AllDaysVC: GenericVC<AllDaysView> & Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupBarButtons()
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
        
    }

    func setupBarButtons() {
        self.tabBarController?.navigationItem.leftBarButtonItem = rootView.leftBarButton
        self.tabBarController?.navigationItem.rightBarButtonItem = rootView.rightBarButton

        rootView.leftBarButton.target = self
        rootView.leftBarButton.action = #selector(allGoalsTapped)

        rootView.rightBarButton.target = self
        rootView.rightBarButton.action = #selector(addGoalTapped)
    }
    
    @objc private func allGoalsTapped() {
        coordinator?.eventOccured(with: .allGoalsTapped)
    }
    
    @objc private func addGoalTapped() {
        
    }
}

extension AllDaysVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCVCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.eventOccured(with: .specificDayTapped)
    }
}
