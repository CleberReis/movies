//
//  MovieDetailSlide.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MovieDetailSlideCell: UICollectionViewCell {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulos Semelhantes"
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        
        return label
    }()
    
    let moviesSlideVC = MoviesSlideVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        addSubview(moviesSlideVC.view)
        moviesSlideVC.view.translatesAutoresizingMaskIntoConstraints = false
        moviesSlideVC.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        moviesSlideVC.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        moviesSlideVC.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        moviesSlideVC.view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
