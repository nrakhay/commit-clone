//
//  ViewControllerFactory.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import UIKit

class ViewControllerFactory {
    func initLoginVC() -> LoginVC {
        let vc = LoginVC()
        return vc
    }
    
    func initTabBarVC() -> TabBarVC {
        let vc = TabBarVC()
        return vc
    }
    
    func initAllDaysVC() -> AllDaysVC {
        let vc = AllDaysVC()
        vc.title = "all"
        return vc
    }
    
    func initTodayVC() -> TodayVC {
        let vc = TodayVC()
        vc.title = "today"
        return vc
    }
    
    func initSettingsVC() -> SettingsVC {
        let vc = SettingsVC()
        vc.title = "settings"
        return vc
    }
    
    func initAllHabitsVC() -> AllHabitsVC {
        let vc = AllHabitsVC()
        return vc
    }
    
    func initAddHabitVC() -> AddHabitVC {
        let vc = AddHabitVC()
        return vc
    }
}

