//
//  GenericVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 14.07.2023.
//

import UIKit

class GenericVC<T: UIView>: UIViewController {
    
    public var rootView: T { return view as! T }
    
    override open func loadView() {
        self.view = T()
    }
}
