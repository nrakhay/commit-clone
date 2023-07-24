//
//  TabBarEnum.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 23.07.2023.
//

enum TabBarPage {
    case alldays
    case today
    case settings

    init?(index: Int) {
        switch index {
        case 0:
            self = .alldays
        case 1:
            self = .today
        case 2:
            self = .settings
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .alldays:
            return "all"
        case .today:
            return "today"
        case .settings:
            return "settings"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .alldays:
            return 0
        case .today:
            return 1
        case .settings:
            return 2
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}

