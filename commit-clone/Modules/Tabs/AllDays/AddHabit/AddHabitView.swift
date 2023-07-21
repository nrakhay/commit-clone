//
//  AddGoalView.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 15.07.2023.
//

import UIKit

class AddHabitView: UIView {
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .white
        return button
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        return sv
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    let commitNameLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you commit to do?"
        label.font = UIFont(name: "CalSans-SemiBold", size: 24)
        label.textColor = .white
        return label
    }()
    
    let commitNameInput: UITextField = {
        let input = UITextField()
        input.layer.cornerRadius = 12
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.white.cgColor
        input.tintColor = UIColor(named: "completed-green")
        input.setPaddingFor(left: 10)
        input.attributedPlaceholder = NSAttributedString(
            string: "Call mom",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        input.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return input
    }()
    
    let frequencyLabel: UILabel = {
        let label = UILabel()
        label.text = "How often?"
        label.font = UIFont(name: "CalSans-SemiBold", size: 24)
        label.textColor = .white
        return label
    }()
    
    let daysSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let kindOfDaySV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        return stackView
    }()
    
    let weekdaysSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        return stackView
    }()
    
    let weekendsSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.spacing = 7
        return stackView
    }()

    let everyDayButton = DayButton(state: .inactive, title: "every day")
    let everyOtherDayButton = DayButton(state: .inactive, title: "every other day")
    let mondayButton = DayButton(state: .inactive, title: "mon")
    let tuesdayButton = DayButton(state: .inactive, title: "tue")
    let wednesdayButton = DayButton(state: .inactive, title: "wed")
    let thursdayButton = DayButton(state: .inactive, title: "thu")
    let fridayButton = DayButton(state: .inactive, title: "fri")
    let saturdayButton = DayButton(state: .inactive, title: "sat")
    let sundayButton = DayButton(state: .inactive, title: "sun")
    
    private func addViews() {
        addSubviews(cancelButton, scrollView)
        scrollView.addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(commitNameLabel, commitNameInput, frequencyLabel, daysSV)
        daysSV.addArrangedSubviews(kindOfDaySV, weekdaysSV, weekendsSV)
        kindOfDaySV.addArrangedSubviews(everyDayButton, everyOtherDayButton)
        weekdaysSV.addArrangedSubviews(mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton)
        weekendsSV.addArrangedSubviews(saturdayButton, sundayButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "background-color")
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        cancelButton.anchor(top: self.safeAreaTopAnchor, paddingTop: -15, width: 36, height: 36)
        cancelButton.centerX(in: self)
        scrollView.anchor(top: cancelButton.bottomAnchor, bottom: self.bottomAnchor, paddingTop: 5, width: 0.9 * self.width)
        scrollView.centerX(in: self)
        commitNameInput.anchor(width: self.width * 0.9, height: 50)
        mainStackView.anchor(width: self.width * 0.9)
        daysSV.anchor(width: self.width * 0.9)
        kindOfDaySV.anchor(width: self.width * 0.9)
        weekdaysSV.anchor(width: self.width * 0.9)
    }
}
