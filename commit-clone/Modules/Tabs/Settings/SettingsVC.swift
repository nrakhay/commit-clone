//
//  SettingsVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit
import Firebase

protocol SettingsVCProtocol: AnyObject {
    var onLogout: (Callback)? { get set }
}

class SettingsVC: GenericVC<SettingsView>, SettingsVCProtocol {
    var onLogout: Callback?
    
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
            
            
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        self.onLogout?()
    }
}
