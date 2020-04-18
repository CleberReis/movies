//
//  MoviesVC.swift
//  movies
//
//  Created by Cleber Reis on 17/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MoviesVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var movies: [Movie] = []
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("in it(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellID)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        let imageView = UIImageView(frame: headerView.frame)
        imageView.image = UIImage(named: "logomarca")
        
        headerView.addSubview(imageView)
        navigationItem.titleView = headerView
        
        self.searchMovies()
    }
}

extension MoviesVC {
    func searchMovies(){
        self.movies = MovieService.shared.searchMovies()
        self.collectionView.reloadData()
    }
}

extension MoviesVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCell
        cell.movie = self.movies[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width / 2 - 32
        let height = width * 1.8
        
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
}
