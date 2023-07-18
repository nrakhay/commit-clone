//
//  AuthCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 18.07.2023.
//

import UIKit

class AuthCoordinator: Coordinator {
    var navController: UINavigationController
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func start() {
        let vc = LoginVC()
        vc.coordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func popVC() {
        navController.popViewController(animated: true)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .loggedIn:
            parentCoordinator?.eventOccured(with: .loggedIn)
        default:
            return
        }
    }
}
