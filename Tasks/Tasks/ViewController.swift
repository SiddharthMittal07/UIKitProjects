//
//  ViewController.swift
//  Tasks
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        for i in 1...10 {
            tasks.append(Task(title: "Task \(i)", id: i))
        }
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let vc = AddTaskViewController()
        vc.addTask = { (text: String) in
            let newTask = Task(title: text, id: self.tasks.count + 1)
            self.tasks.append(newTask)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func editTitle(text: String, index: Int) {
        let vc = TaskViewController()
        vc.taskTitle = text
        vc.editTask = { (newTitle: String) in
            if newTitle.isEmpty {
                self.tasks[index].title = nil
            } else {
                self.tasks[index].title = newTitle
            }
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let taskTitle = tasks[indexPath.row].title {
            editTitle(text: taskTitle, index: indexPath.row)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let taskTitle = tasks[indexPath.row].title {
            cell.textLabel?.text = taskTitle
        }
        return cell
    }
    
}

struct Task {
    var title: String?
    var id: Int
}
