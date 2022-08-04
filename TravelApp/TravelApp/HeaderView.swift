//
//  HeaderView.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 03/08/22.
//

import UIKit

class HeaderView: UIView {

    var title: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    var moreLabel: UIButton = {
        var label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("See More", for: .normal)
        label.setTitleColor(UIColor.blue, for: .normal)
        label.titleLabel?.font = .systemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        self.addSubview(moreLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.trailingAnchor.constraint(lessThanOrEqualTo: moreLabel.leadingAnchor, constant: -10),
            title.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            moreLabel.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            moreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
    }
    
    func configure(with title: String) {
        self.title.text = title
    }

}
