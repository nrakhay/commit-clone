//
//  Controller.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 11.07.2023.
//

import UIKit

enum Event {
    
}

protocol Coordinator: AnyObject {
    var navController: UINavigationController? { get }
    
    func start()
    func popVC()
    func eventOccured(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}