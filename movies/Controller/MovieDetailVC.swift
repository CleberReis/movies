//
//  MovieDetailVC.swift
//  movies
//
//  Created by Cleber Reis on 19/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class MovieDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movie: Movie? {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    let headerId = "headerId"
    let descriptionId = "descriptionId"
    let slideId = "slideId"
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(MovieDetailHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(MovieDetailDescriptionCell.self, forCellWithReuseIdentifier: descriptionId)
        collectionView.register(MovieDetailSlideCell.self, forCellWithReuseIdentifier: slideId)
        
    }
}

extension MovieDetailVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! MovieDetailHeaderCell
            cell.movie = self.movie
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath) as! MovieDetailDescriptionCell
            cell.movie = self.movie
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: slideId, for: indexPath) as! MovieDetailSlideCell
    
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        var height = width * 0.7
        
        if indexPath.item == 1 {
            let newCell = MovieDetailDescriptionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            newCell.movie = self.movie
            newCell.layoutIfNeeded()
            
            let estimateHeight = newCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimateHeight.height
        }
        
        return .init(width: width, height: height)
    }
    
}
