//
//  MainCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var navController: UINavigationController?
    var children: [Coordinator]? = nil
    
    func start() {
        var vc: UIViewController & Coordinating = TabBarVC()
        vc.coordinator = self
        navController?.pushViewController(vc, animated: false)
    }
    
    func popVC() {
        navController?.popViewController(animated: false)
    }
    
    func eventOccured(with type: Event) {
        switch type {
            
        }
    }
}
