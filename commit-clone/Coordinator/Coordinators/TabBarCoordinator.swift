//
//  MainCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

final class TabBarCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    //MARK: - CoordinatorFinishOutput
    
    var finishFlow: Callback?
    
    //MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            showTabBarVC()
        }
        
    }
    
    //MARK: - Private methods
    
    private func showTabBarVC() {
        let tabBarVC = self.viewControllerFactory.initTabBarVC()
        
        let allDaysCoordinator = self.coordinatorFactory.makeAllDaysCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        let todayVC = self.viewControllerFactory.initTodayVC()
        let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        
        settingsCoordinator.finishFlow = { [unowned self] in
            self.removeDependency(settingsCoordinator)
            self.removeDependency(allDaysCoordinator)
            self.finishFlow?()
        }
        
        self.addDependency(allDaysCoordinator)
        self.addDependency(settingsCoordinator)
        
        let allDays = allDaysCoordinator.startAndReturnVC()
        let settingsVC = settingsCoordinator.startAndReturnVC()
        
        tabBarVC.setupVC(with: [allDays, todayVC, settingsVC])
        
        self.router.setRootModule(tabBarVC)
    }
    
    
    
    
    //MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
}
