//
//  TabBarCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 14.07.2023.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var navController: UINavigationController
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func start() {
        let vc = TabBarVC()
        
        let allDaysVC = AllDaysVC()
        allDaysVC.title = "all"
        allDaysVC.coordinator = self

        let todayVC = TodayVC()
        todayVC.title = "today"
        todayVC.coordinator = self

        let settingsVC = SettingsVC()
        settingsVC.title = "settings"
        settingsVC.coordinator = self
        
        vc.setupVC(with: [allDaysVC, todayVC, settingsVC])
        
        vc.coordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func popVC() {
        navController.popViewController(animated: true)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .allGoalsTapped:
            var vc: UIViewController & Coordinating = AllGoalsVC()
            vc.coordinator = self
            navController.pushViewController(vc, animated: true)
        case .addGoalTapped:
            var vc: UIViewController & Coordinating = AddGoalVC()
            vc.coordinator = self
            navController.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
