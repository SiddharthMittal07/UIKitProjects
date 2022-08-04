//
//  DestinationCollectionViewCell.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 03/08/22.
//

import UIKit

class DestinationCollectionViewCell: UICollectionViewCell {
    static let identifier = "DestinationCollectionViewCell"
    
    var image: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    var destinationName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    var destinationCountry: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    var locationImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "location")
        imageView.tintColor = .white
        return imageView
    }()
    
    var activitiesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    var destinationDesc: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(image)
        contentView.addSubview(destinationName)
        contentView.addSubview(destinationDesc)
        contentView.addSubview(locationImage)
        contentView.addSubview(destinationCountry)
        contentView.addSubview(activitiesLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 160),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            locationImage.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10),
            locationImage.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 7),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
            locationImage.heightAnchor.constraint(equalToConstant: 20),
            
            destinationCountry.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10),
            destinationCountry.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            destinationCountry.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            destinationName.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 7),
            destinationName.bottomAnchor.constraint(equalTo: locationImage.topAnchor, constant: -5),
        ])
        
        NSLayoutConstraint.activate([
            activitiesLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            activitiesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            
            destinationDesc.topAnchor.constraint(equalTo: activitiesLabel.bottomAnchor, constant: 5),
            destinationDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            destinationDesc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with destination: Destination) {
        image.image = UIImage(named: destination.imageUrl)
        destinationName.text = destination.city
        destinationCountry.text = destination.country
        activitiesLabel.text = "\(destination.activities.count) Activities"
        destinationDesc.text = destination.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        destinationName.text = nil
        destinationCountry.text = nil
        activitiesLabel.text = nil
        destinationDesc.text = nil
    }
}
