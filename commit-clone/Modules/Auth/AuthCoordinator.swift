//
//  AuthCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 18.07.2023.
//

import UIKit

typealias Callback = () -> Void

enum AuthCoordinatorStatus {
    case
}
class AuthCoordinator: Coordinator {
    var navController: UINavigationController
    
    var onFlowDidFinish: Callback?
    
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
            popVC()
            parentCoordinator?.eventOccured(with: .loggedIn)
        default:
            return
        }
    }
}
