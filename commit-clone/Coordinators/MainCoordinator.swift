//
//  MainCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit
import Firebase

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func start() {
        if Auth.auth().currentUser == nil {
            goToAuth()
        } else {
            goToHome()
        }
    }
    
    func goToAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navController)
        children.removeAll()
        children.append(authCoordinator)
        authCoordinator.parentCoordinator = self
        authCoordinator.start()
    }
    
    func goToHome() {
        let tabBarCoordinator = TabBarCoordinator.init(navigationController: navController)
        children.removeAll()
        children.append(tabBarCoordinator)
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .loggedOut:
            goToAuth()
        case .loggedIn:
            goToHome()
        default:
            return
        }
    }
    
    func popVC() {
        navController.popViewController(animated: false)
    }
}
