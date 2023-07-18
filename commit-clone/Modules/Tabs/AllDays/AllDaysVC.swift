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
    
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
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
