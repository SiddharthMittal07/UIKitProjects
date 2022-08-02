//
//  CustomHeaderView.swift
//  FeedDemo
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    var label: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "CustomHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(with text: String) {
        label.text = text
    }
    
    override func prepareForReuse() {
        label.text = nil
    }
}
