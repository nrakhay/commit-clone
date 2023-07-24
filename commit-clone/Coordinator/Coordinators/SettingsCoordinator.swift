//
//  SettingsCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

class SettingsCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    //MARK: - CoordinatorFinishOutput
    
    var finishFlow: Callback?
    
    //MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    //MARK: - Private Methods
    
    private func showSettingsVC(vc: SettingsVC) {
        vc.onLogout = { [unowned self] in
            
            self.finishFlow?()
        }
        
        self.router.setRootModule(vc)
    }
    
    //MARK: - Coordinator
    
    override func start() {
        let vc = self.viewControllerFactory.initSettingsVC()
        self.showSettingsVC(vc: vc)
    }
    
    func startAndReturnVC() -> SettingsVC {
        let vc = self.viewControllerFactory.initSettingsVC()
        self.showSettingsVC(vc: vc)
        return vc
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
}
