//
//  Controller.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navController: UINavigationController { get }
    
    func start()
    func popVC()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
