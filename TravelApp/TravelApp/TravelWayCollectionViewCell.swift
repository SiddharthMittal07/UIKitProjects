//
//  TravelWayCollectionViewCell.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 03/08/22.
//

import UIKit

class TravelWayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TravelWayCollectionViewCell"
    
    var image: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var bgView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bgView)
        contentView.addSubview(image)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bgView.widthAnchor.constraint(equalToConstant: 60),
            bgView.heightAnchor.constraint(equalToConstant: 60),
            
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 30),
            image.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with travelType: TravelType) {
        image.image = UIImage(systemName: travelType.content)
        image.tintColor = travelType.isSelected ? .blue : .secondaryLabel
        bgView.backgroundColor = travelType.isSelected ? .systemCyan : .systemGray4
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        image.tintColor = nil
    }
}
