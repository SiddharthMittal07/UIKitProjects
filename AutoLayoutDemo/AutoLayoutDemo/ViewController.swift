//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Siddharth Mittal on 31/07/22.
//

import UIKit

class ViewController: UIViewController {

    private var isFollowing: Bool = false
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Michael G Scott"
        label.textColor = .label
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "scott")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Follow  ", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let info: UILabel = {
        let textView = UILabel()
        textView.text = "HELLO MY NAME IS NOT MICHAEL SCOTT. I AM MICHAEL SCARN. MICHAEL SCOTT ROLLING LIKE A PIIIIIMP"
        textView.textColor = .label
        textView.font = .systemFont(ofSize: 18)
        textView.numberOfLines = 0
        textView.textAlignment = .center
        return textView
    }()
    
    let comments: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.placeholder = "  Enter comments..."
        tf.layer.cornerRadius = 8
        return tf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        [name, profileImage, followButton, info, comments].forEach { subView in
            view.addSubview(subView)
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            profileImage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            profileImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            
            followButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            info.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 30),
            info.bottomAnchor.constraint(lessThanOrEqualTo: comments.topAnchor, constant: -30),
            info.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            info.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            
            comments.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            comments.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            comments.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        
        ])
    }
    
    @objc private func followButtonTapped() {
        isFollowing.toggle()
        if isFollowing {
            followButton.setTitle("  Following  ", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .systemBlue
        } else {
            followButton.setTitle("  Follow  ", for: .normal)
            followButton.setTitleColor(.blue, for: .normal)
            followButton.backgroundColor = .white
        }
    }
}

