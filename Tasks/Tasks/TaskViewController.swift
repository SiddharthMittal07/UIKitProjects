//
//  TaskViewController.swift
//  Tasks
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class TaskViewController: UIViewController, UITextFieldDelegate {
    
    var editTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var taskTitle: String? {
        didSet {
            self.editTextField.text = taskTitle
        }
    }
    var editTask: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Edit Task"
        view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(taskEdit))
        
        view.addSubview(editTextField)
        editTextField.delegate = self
        setupConstraints()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let title = editTextField.text {
            if title.isEmpty {
                navigationItem.rightBarButtonItem?.title = "DELETE"
            } else {
                navigationItem.rightBarButtonItem?.title = "EDIT"
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        taskEdit()
        return true
    }
    
    @objc func taskEdit() {
        if let taskTitle = editTextField.text {
            editTask?(taskTitle)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            editTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            editTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            editTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editTextField.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    

}
