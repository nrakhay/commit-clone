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
    
    let tabVC = TabBarVC()
    
    func start() {
        let allDaysVC = AllDaysVC()
        allDaysVC.title = "all"
        allDaysVC.coordinator = self

        let todayVC = TodayVC()
        todayVC.title = "today"
        todayVC.coordinator = self

        let settingsVC = SettingsVC()
        settingsVC.title = "settings"
        settingsVC.coordinator = self
        
        tabVC.setupVC(with: [allDaysVC, todayVC, settingsVC])
        
        tabVC.coordinator = self
        navController.pushViewController(tabVC, animated: false)
    }
    
    func popVC() {
        navController.popViewController(animated: true)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .allGoalsTapped:
            var vc: UIViewController & Coordinating = AllHabitsVC()
            vc.coordinator = self
            navController.pushViewController(vc, animated: true)
        case .addGoalTapped:
            var vc: UIViewController & Coordinating = AddHabitVC()
            vc.coordinator = self
            navController.pushViewController(vc, animated: true)
        case .specificDayTapped:
            var vc: UIViewController & Coordinating = SingleDayVC()
            vc.coordinator = self
            navController.pushViewController(vc, animated: true)
        case .loggedOut:
            parentCoordinator?.eventOccured(with: .loggedOut)
        default:
            return
        }
    }
}
