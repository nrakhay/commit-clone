//
//  MainVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

class TabBarVC: UITabBarController, Coordinating {
    var coordinator: Coordinator?
    private let images = [("square.grid.3x3", "square.grid.3x3.fill"),
                          ("square", "square.fill"),
                          ("gearshape", "gearshape.fill")]
    
    let leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    let rightBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: nil, action: nil)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
        
        configureTabBar()
        setupBarButtons()
        navigationItem.hidesBackButton = true
        self.delegate = self
    }
    
    func setupBarButtons() {
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
        leftBarButton.target = self
        leftBarButton.action = #selector(allGoalsTapped)

        rightBarButton.target = self
        rightBarButton.action = #selector(addGoalTapped)
    }
    
    @objc private func allGoalsTapped() {
        coordinator?.eventOccured(with: .allGoalsTapped)
    }
    
    @objc private func addGoalTapped() {
        coordinator?.eventOccured(with: .addGoalTapped)
    }
    
    func configureTabBar() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = UIColor(named: "background-color")
        modalPresentationStyle = .fullScreen
        
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
    }
    
    func setupVC(with viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: true)
        setImagesToTabBar()
    }
    
    private func setImagesToTabBar() {
        setImage(to: 0, fill: true)
        setImage(to: 1, fill: false)
        setImage(to: 2, fill: false)
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

extension TabBarVC: SettingsViewDelegate {
    func logoutTapped() {
        setViewControllers(nil, animated: true)
    }
}

extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 1 || tabBarIndex == 2 {
            navigationItem.leftBarButtonItem = nil
            navigationItem.rightBarButtonItem = nil
        } else {
            setupBarButtons()
        }
        
        for x in 0..<images.count {
            if tabBarIndex == x {
                setImage(to: x, fill: true)
            } else {
                setImage(to: x, fill: false)
            }
        }
        
        
    }
}
