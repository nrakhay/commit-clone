//
//  MainVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class TabBarVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    private let tabBarVC = UITabBarController()
    private let images = [("square.grid.3x3", "square.grid.3x3.fill"),
                          ("square", "square.fill"),
                          ("gearshape", "gearshape.fill")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
        
        configureTabBar()
        self.tabBarVC.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        present(tabBarVC, animated: false)
    }
    
    private func configureTabBar() {
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.unselectedItemTintColor = .lightGray
        tabBarVC.tabBar.backgroundColor = UIColor(named: "background-color")
        tabBarVC.modalPresentationStyle = .fullScreen
        
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
        
        addViewControllersToTabBar()
        setImagesToTabBar()
    }
    
    private func setImagesToTabBar() {
        setImage(to: 0, fill: true)
        setImage(to: 1, fill: false)
        setImage(to: 2, fill: false)
    }
    
    private func addViewControllersToTabBar() {
        let allDaysVC = AllDaysVC()
        allDaysVC.title = "all days"
        let todayVC = TodayVC()
        todayVC.title = "today"
        let settingsVC = SettingsVC()
        settingsVC.title = "settings"

        
        tabBarVC.setViewControllers([allDaysVC, todayVC, settingsVC], animated: false)
    }
    
    func setImage(to index: Int, fill: Bool) {
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        if fill {
            items[index].image = UIImage(systemName: images[index].1)
        } else {
            items[index].image = UIImage(systemName: images[index].0)
        }
    }
}

extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        for x in 0..<images.count {
            if tabBarIndex == x {
                setImage(to: x, fill: true)
            } else {
                setImage(to: x, fill: false)
            }
        }
        
        
    }
}
