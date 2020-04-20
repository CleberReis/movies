//
//  MovieSlideCell.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MovieSlideCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet{
            if let movie = movie {
                thumbImageView.image = UIImage(named: movie.thumbUrl)
            }
        }
    }
    
    let thumbImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .purple
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(thumbImageView)
        thumbImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        thumbImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        thumbImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
