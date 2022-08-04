//
//  ActivityTableViewCell.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 04/08/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    static let identifer = "ActivityTableViewCell"
    
    var bgView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    var image: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    var activityName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    var activityType: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    var activityRating: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    var ticketPrice: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    
    var endTime: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    
    var startTime: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    
    var ticketImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "ticket")
        return imageView
    }()
    
    var startImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "clock")
        return imageView
    }()
    
    
    var endImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "clock")
        return imageView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(bgView)
        contentView.addSubview(image)
        contentView.addSubview(activityName)
        contentView.addSubview(activityType)
        contentView.addSubview(activityRating)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalTo: bgView.widthAnchor, multiplier: 0.45),
        ])
        
        NSLayoutConstraint.activate([
            activityName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            activityName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            activityName.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
//            activityName.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        NSLayoutConstraint.activate([
            activityType.topAnchor.constraint(equalTo: activityName.bottomAnchor, constant: 5),
            activityType.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            activityType.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
//            activityType.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            activityRating.topAnchor.constraint(equalTo: activityType.bottomAnchor, constant: 5),
            activityRating.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            activityRating.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
//            activityRating.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with activity: Activity) {
        image.image = UIImage(named: activity.imageUrl)
        activityName.text = activity.name
        activityType.text = activity.type
        var ratingString = ""
        for _ in 0..<activity.rating {
            ratingString += "⭐️"
        }
        activityRating.text = ratingString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        activityName.text = nil
        activityType.text = nil
        activityRating.text = nil
    }
}


