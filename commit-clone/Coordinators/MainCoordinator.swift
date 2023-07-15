//
//  MainCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func start() {
//        var vc: UIViewController & Coordinating = TabBarVC()
//        vc.coordinator = self
//        navController?.pushViewController(vc, animated: false)
        goToHome()
        
    }
    
    func goToHome() {
        let tabBarCoordinator = TabBarCoordinator.init(navigationController: navController)
        children.removeAll()
        children.append(tabBarCoordinator)
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
    }
    
    func eventOccured(with type: Event) {
        return
    }
    
    func popVC() {
        navController.popViewController(animated: false)
    }
}
