//
//  AllDaysVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

protocol AllDaysVCProtocol {
    var onAllHabits: Callback? { get set }
    var onAddHabit: Callback? { get set }
}

class AllDaysVC: GenericVC<AllDaysView>, AllDaysVCProtocol {
    var onAddHabit: Callback?
    var onAllHabits: Callback?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBarButtons()
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
        self.onAllHabits?()
    }
    
    @objc private func addGoalTapped() {
        self.onAddHabit?()
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
    }
}
