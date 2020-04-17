//
//  MoviesVC.swift
//  movies
//
//  Created by Cleber Reis on 17/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MoviesVC: UICollectionViewController {
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        let imageView = UIImageView(frame: headerView.frame)
        imageView.image = UIImage(named: "logomarca")
        
        headerView.addSubview(imageView)
        navigationItem.titleView = headerView
    }
}
