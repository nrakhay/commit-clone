//
//  AuthCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    //MARK: - CoordinatorFinishOutput
    
    var finishFlow: Callback?
    
    //MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    
    //MARK: - Private methods
    
    private func showLoginVC() {
        let loginVC = self.viewControllerFactory.initLoginVC()
        
        loginVC.onLogin = { [unowned self] in
            self.finishFlow?()
        }
        
        self.router.setRootModule(loginVC, hideBar: true)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showLoginVC()
    }
    
    //MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    
    
}
