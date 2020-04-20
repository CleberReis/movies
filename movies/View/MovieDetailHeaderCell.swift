//
//  MovieDetailHeaderCell.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MovieDetailHeaderCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet{
            if let movie = movie {
                imageHeaderView.image = UIImage(named: movie.thumbDetailUrl)
                titleLabel.text = movie.title
            }
        }
    }
    
    let imageHeaderView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cartaz-destaque-1")
        image.backgroundColor = .purple
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulo"
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 2
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageHeaderView.heightAnchor.constraint(equalToConstant: bounds.height * 0.7).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageHeaderView, titleLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -24).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
