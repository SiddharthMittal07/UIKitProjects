//
//  CustomCollectionViewCell.swift
//  FeedDemo
//
//  Created by Siddharth Mittal on 02/08/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"

    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        contentView.layer.cornerRadius = 7
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Model) {
        self.image.image = UIImage(named: model.image)
    }
    
    override func prepareForReuse() {
        self.image.image = nil
    }
}
