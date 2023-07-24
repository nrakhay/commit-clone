//
//  Coordinator.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func start(with option: DeepLinkOption?)
}
