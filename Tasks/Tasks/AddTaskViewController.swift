//
//  AddTaskViewController.swift
//  Tasks
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    let inputTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "  Enter task..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    var addTask: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = "Add Task"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .done, target: self, action: #selector(saveTask))
        view.addSubview(inputTextField)
        inputTextField.delegate = self
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            inputTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            inputTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            inputTextField.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        saveTask()
        return true
    }
    
    @objc func saveTask() {
        if let task = inputTextField.text, !task.isEmpty {
            addTask?(task)
        }
        navigationController?.popViewController(animated: true)
    }
}
