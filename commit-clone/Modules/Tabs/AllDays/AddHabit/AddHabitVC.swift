//
//  AddGoalVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

protocol AddHabitVCProtocol {
    var onCancelTapped: Callback? { get set }
}

class AddHabitVC: GenericVC<AddHabitView>, AddHabitVCProtocol {
    var onCancelTapped: Callback?
    
    private var daySelected = ["mon": false,
                               "tue": false,
                               "wed": false,
                               "thu": false,
                               "fri": false,
                               "sat": false,
                               "sun": false]
    
    private var numberOfDaysSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        navigationItem.hidesBackButton = true
        addTargets()
        
    }
    
    private func addTargets() {
        rootView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        
        rootView.everyDayButton.addTarget(self, action: #selector(everyDayTapped), for: .touchUpInside)
        rootView.everyOtherDayButton.addTarget(self, action: #selector(everyOtherDayTapped), for: .touchUpInside)
        
        rootView.mondayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.tuesdayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.wednesdayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.thursdayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.fridayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.saturdayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        rootView.sundayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
    }
    
    @objc private func dayTapped(sender: DayButton) {
        if numberOfDaysSelected == 7 {
//            setEachDayActive() 
        }
        
        if let text = sender.titleLabel?.text {
            if daySelected[text] == false {
                daySelected[text] = true
                sender.buttonState = .active
            } else {
                daySelected[text] = false
                sender.buttonState = .inactive
            }
        }
    }
    
    @objc private func everyDayTapped() {
        
    }
    
    
    @objc private func everyOtherDayTapped() {
        
    }
    
    @objc private func cancelTapped() {
        self.onCancelTapped?()
    }

}
