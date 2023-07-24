//
//  LaunchInstructor.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

import Foundation
import Firebase

fileprivate var onboardingWasShown = true
fileprivate var isAutorized = Auth.auth().currentUser == nil ? false : true

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure( tutorialWasShown: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}
