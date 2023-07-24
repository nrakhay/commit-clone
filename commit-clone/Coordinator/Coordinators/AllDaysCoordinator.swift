//
//  AllDaysCoordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

class AllDaysCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    //MARK: - CoordinatorFinishOutput
    
    var finishFlow: Callback?
    
    //MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    //MARK: - Private Methods
    
    private func showAllDaysVC(vc: AllDaysVC) {
        vc.onAllHabits = { [unowned self] in
            self.showAllHabitsVC()
            
        }
        
        vc.onAddHabit = { [unowned self] in
            self.showAddHabitVC()
        }
        
        self.router.setRootModule(vc)
    }
    
    private func showAllHabitsVC() {
        let vc = viewControllerFactory.initAllHabitsVC()
        
        vc.onBackTapped = { [unowned self] in
            self.router.popModule()
        }
        
        self.router.push(vc)
    }
    
    private func showAddHabitVC() {
        let vc = viewControllerFactory.initAddHabitVC()
        
        vc.onCancelTapped = { [unowned self] in
            self.router.popModule()
        }
        
        self.router.push(vc)
    }
    
    //MARK: - Coordinator
    
    override func start() {
        let vc = self.viewControllerFactory.initAllDaysVC()
        self.showAllDaysVC(vc: vc)
    }
    
    func startAndReturnVC() -> AllDaysVC{
        let vc = self.viewControllerFactory.initAllDaysVC()
        self.showAllDaysVC(vc: vc)
        return vc
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
}
