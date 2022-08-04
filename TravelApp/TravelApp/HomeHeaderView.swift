//
//  HomeHeaderView.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 04/08/22.
//

import UIKit

class HomeHeaderView: UIView {

    var travelTypes = [
        TravelType(isSelected: true, content: "airplane.departure"),
        TravelType(isSelected: false, content: "car"),
        TravelType(isSelected: false, content: "figure.walk"),
        TravelType(isSelected: false, content: "bicycle")
    ]
    
    var hotels = DataService.hotels
    var destinations = DataService.destinations
    
    var topLabel: UILabel = {
        var label = UILabel()
        label.text = "What would you like to find?"
        label.font = .systemFont(ofSize: 35, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var travelWayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 80, height: 80)
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TravelWayCollectionViewCell.self, forCellWithReuseIdentifier: TravelWayCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var hotelsCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 240)
        layout.minimumLineSpacing = 25
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(HotelCollectionViewCell.self, forCellWithReuseIdentifier: HotelCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var destinationsCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 240)
        layout.minimumLineSpacing = 25
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.identifier)
        return collectionView
    }()
    
    var hotelsCarouselHeader = HeaderView()
    var destinationsCarouselHeader = HeaderView()
    var activitiesHeader = HeaderView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .secondarySystemBackground
        
        travelWayCollectionView.dataSource = self
        travelWayCollectionView.delegate = self
        
        hotelsCarousel.delegate = self
        hotelsCarousel.dataSource = self
        
        hotelsCarouselHeader.translatesAutoresizingMaskIntoConstraints = false
        hotelsCarouselHeader.configure(with: "Top Hotels")
        
        destinationsCarouselHeader.translatesAutoresizingMaskIntoConstraints = false
        destinationsCarouselHeader.configure(with: "Top Destinations")
        
        activitiesHeader.translatesAutoresizingMaskIntoConstraints = false
        activitiesHeader.configure(with: "Top Activities")
        
        destinationsCarousel.delegate = self
        destinationsCarousel.dataSource = self
        
        self.addSubview(topLabel)
        self.addSubview(travelWayCollectionView)
        self.addSubview(hotelsCarouselHeader)
        self.addSubview(hotelsCarousel)
        self.addSubview(destinationsCarouselHeader)
        self.addSubview(destinationsCarousel)
        self.addSubview(activitiesHeader)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            topLabel.heightAnchor.constraint(equalToConstant: 90),
        ])
        
        NSLayoutConstraint.activate([
            travelWayCollectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            travelWayCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            travelWayCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            travelWayCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            hotelsCarouselHeader.topAnchor.constraint(equalTo: travelWayCollectionView.bottomAnchor),
            hotelsCarouselHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hotelsCarouselHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hotelsCarouselHeader.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            hotelsCarousel.topAnchor.constraint(equalTo: hotelsCarouselHeader.bottomAnchor, constant: 15),
            hotelsCarousel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            hotelsCarousel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hotelsCarousel.heightAnchor.constraint(equalToConstant: 240),
        ])
        
        NSLayoutConstraint.activate([
            destinationsCarouselHeader.topAnchor.constraint(equalTo: hotelsCarousel.bottomAnchor, constant: 10),
            destinationsCarouselHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            destinationsCarouselHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            destinationsCarouselHeader.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            destinationsCarousel.topAnchor.constraint(equalTo: destinationsCarouselHeader.bottomAnchor, constant: 15),
            destinationsCarousel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            destinationsCarousel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            destinationsCarousel.heightAnchor.constraint(equalToConstant: 240),
        ])
        
        NSLayoutConstraint.activate([
            activitiesHeader.topAnchor.constraint(equalTo: destinationsCarousel.bottomAnchor, constant: 15),
            activitiesHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            activitiesHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            activitiesHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.travelWayCollectionView {
            return travelTypes.count
        } else if collectionView == self.hotelsCarousel {
            return hotels.count
        } else {
            return destinations.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.travelWayCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelWayCollectionViewCell.identifier, for: indexPath) as! TravelWayCollectionViewCell
            cell.configure(with: travelTypes[indexPath.item])
            return cell
        } else if collectionView == self.hotelsCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCollectionViewCell.identifier, for: indexPath) as! HotelCollectionViewCell
            cell.configure(with: hotels[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCollectionViewCell.identifier, for: indexPath) as! DestinationCollectionViewCell
            cell.configure(with: destinations[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.travelWayCollectionView {
            for index in travelTypes.indices {
                travelTypes[index].isSelected = false
            }
            travelTypes[indexPath.item].isSelected = true
            collectionView.reloadData()
        } else if collectionView == self.hotelsCarousel {
            
        } else {
            
        }
    }
    
    
}
