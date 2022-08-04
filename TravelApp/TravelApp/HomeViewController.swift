//
//  HomeViewController.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 03/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    let activities = DataService.activities

    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ActivityTableViewCell.self, forCellReuseIdentifier: ActivityTableViewCell.identifer)
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let homeHeader = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height * 1.15))
        tableView.tableHeaderView = homeHeader
        tableView.backgroundColor = .secondarySystemBackground
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifer, for: indexPath) as! ActivityTableViewCell
        cell.configure(with: activities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
