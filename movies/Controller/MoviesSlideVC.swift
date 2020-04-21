//
//  MoviesSlideVC.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MoviesSlideVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movies: [Movie] = []
    
    let cellId = "cellId"
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(MovieSlideCell.self, forCellWithReuseIdentifier: cellId)
        
        self.searchMovies()
    }
}

extension MoviesSlideVC {
    func searchMovies(){
        self.movies = MovieService.shared.searchMovies().reversed()
        self.collectionView.reloadData()
    }
}

extension MoviesSlideVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieSlideCell
        cell.movie = self.movies[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.height * 0.6
        let height = view.bounds.height
        
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 24, bottom: 0, right: 24)
    }
}
