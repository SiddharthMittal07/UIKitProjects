//
//  HotelCollectionViewCell.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 03/08/22.
//

import UIKit

class HotelCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "HotelCollectionViewCell"
    
    var image: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    var hotelName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    var hotelDesc: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    var bedImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bed.double")
        return imageView
    }()
    
    var hotelPrice: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(image)
        contentView.addSubview(hotelName)
        contentView.addSubview(hotelDesc)
        contentView.addSubview(bedImage)
        contentView.addSubview(hotelPrice)
        
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
            hotelName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 7),
            hotelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hotelName.heightAnchor.constraint(equalToConstant: 25),
            hotelName.trailingAnchor.constraint(lessThanOrEqualTo: bedImage.leadingAnchor, constant: -5),
        ])
        
        NSLayoutConstraint.activate([
            hotelDesc.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 5),
            hotelDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hotelDesc.heightAnchor.constraint(equalToConstant: 20),
            hotelDesc.trailingAnchor.constraint(lessThanOrEqualTo: hotelPrice.leadingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            bedImage.centerYAnchor.constraint(equalTo: hotelName.centerYAnchor),
            bedImage.centerXAnchor.constraint(equalTo: hotelPrice.centerXAnchor),
            bedImage.widthAnchor.constraint(equalToConstant: 20),
            bedImage.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            hotelPrice.centerYAnchor.constraint(equalTo: hotelDesc.centerYAnchor),
            hotelPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with hotel: Hotel) {
        image.image = UIImage(named: hotel.imageUrl)
        hotelName.text = hotel.name
        hotelDesc.text = hotel.address
        hotelPrice.text = "\(hotel.price)$"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
