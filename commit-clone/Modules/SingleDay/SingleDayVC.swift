//
//  SingleDayVC.swift
//  commit-clone
//
//  Created by Nurali Rakhay on 16.07.2023.
//

import UIKit

class SingleDayVC: GenericVC<SingleDayView>, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
        setupTableView()
    }
    
    private func setupTableView() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setupBarButton() {
        navigationItem.leftBarButtonItem = rootView.leftBarButton
        rootView.leftBarButton.target = self
        rootView.leftBarButton.action = #selector(backTapped)
    }
    
    @objc private func backTapped() {
        coordinator?.popVC()
    }
}

extension SingleDayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SingleDayTVCell.identifier,
            for: indexPath) as? SingleDayTVCell
        else {
            fatalError()
        }
        
        cell.configure(with: .init(habitName: "gym"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SingleDayTVCell.preferredHeight
    }
    
}
