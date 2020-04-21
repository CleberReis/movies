//
//  SearchCell.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    var movie: Movie? {
        didSet{
            if let movie = movie {
                thumbImageView.image = UIImage(named: movie.thumbDetailUrl)
                titleLabel.text = movie.title
                descriptionLabel.text = movie.description
            }
        }
    }
    
    let thumbImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.backgroundColor = .purple
        image.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulo"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descrição"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .darkText
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let infoStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        
        let stackView = UIStackView(arrangedSubviews: [thumbImageView, infoStackView])
        stackView.spacing = 16
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
