//
//  TabBarCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 14.07.2023.
//

import UIKit

enum TabBarEvent {
    case allGoalsTapped
    case addGoalTapped
}

class TabBarCoordinator: Coordinator {
    var navController: UINavigationController
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func start() {
        var vc: UIViewController & Coordinating = TabBarVC()
        vc.coordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func popVC() {
        navController.popViewController(animated: false)
    }
    
    func eventOccured(with type: TabBarEvent) {
        switch type {
        case .addGoalTapped:
            
        }
    }
}
