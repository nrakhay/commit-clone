//
//  MainVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit
import SwiftUI

class TabBarVC: UITabBarController, Coordinating {
    var coordinator: Coordinator?
    private let images = [("square.grid.3x3", "square.grid.3x3.fill"),
                          ("square", "square.fill"),
                          ("gearshape", "gearshape.fill")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
        
        configureTabBar()
        self.delegate = self
    }
    
    private func configureTabBar() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = UIColor(named: "background-color")
        modalPresentationStyle = .fullScreen
        
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
//        let allDaysVC = UIHostingController(rootView: SwiftUIView())
        allDaysVC.title = "all"
        let todayVC = TodayVC()
        todayVC.title = "today"
        let settingsVC = SettingsVC()
        settingsVC.title = "settings"

        
        self.setViewControllers([allDaysVC, todayVC, settingsVC], animated: false)
    }
    
    func setImage(to index: Int, fill: Bool) {
        guard let items = tabBar.items else {
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