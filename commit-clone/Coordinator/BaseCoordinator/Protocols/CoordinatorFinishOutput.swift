//
//  CoordinatorFinishOutput.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation

protocol CoordinatorFinishOutput {
    var finishFlow: (Callback)? { get set }
}
