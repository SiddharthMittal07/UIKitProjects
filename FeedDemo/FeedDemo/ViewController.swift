//
//  ViewController.swift
//  FeedDemo
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    var titles = [Title]()
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Netflix Feed"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        
        models.append(Model(label: "Image 0", image: "image-0"))
        models.append(Model(label: "Image 1", image: "image-1"))
        models.append(Model(label: "Image 2", image: "image-2"))
        models.append(Model(label: "Image 0", image: "image-0"))
        models.append(Model(label: "Image 1", image: "image-1"))
        models.append(Model(label: "Image 2", image: "image-2"))
        models.append(Model(label: "Image 0", image: "image-0"))
        models.append(Model(label: "Image 1", image: "image-1"))
        models.append(Model(label: "Image 2", image: "image-2"))
        models.append(Model(label: "Image 0", image: "image-0"))
        models.append(Model(label: "Image 1", image: "image-1"))
        models.append(Model(label: "Image 2", image: "image-2"))
        
        titles.append(Title(text: "Popular TV", models: models))
        titles.append(Title(text: "Popular Movies", models: models))
        titles.append(Title(text: "Trending TV", models: models))
        titles.append(Title(text: "Popular Documentaries", models: models))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.models = titles[indexPath.row].models
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as! CustomHeaderView
        header.configure(with: titles[section].text)
        return header
    }
}

struct Title {
    let text: String
    let models: [Model]
}

struct Model {
    var label: String
    var image: String
}
