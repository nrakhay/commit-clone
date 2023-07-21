//
//  SettingsVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit
import Firebase

class SettingsVC: GenericVC<SettingsView>, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        navigationItem.hidesBackButton = true
    }
}

extension SettingsVC: SettingsViewDelegate {
    func logoutTapped() {
        do {
            try Auth.auth().signOut()
            print("logged out")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
        coordinator?.eventOccured(with: .loggedOut)
    }
}
