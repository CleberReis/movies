//
//  SearchVC.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController, UISearchBarDelegate {
    
    let searchControler = UISearchController(searchResultsController: nil)
    let cellId = "cellId"
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        
        self.configSearchBar()
        self.searchMovies()
    }
    
    func configSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchControler
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchControler.obscuresBackgroundDuringPresentation = false
        searchControler.searchBar.placeholder = "Descubra novo filmes"
        searchControler.searchBar.delegate = self
    }
    
}

extension SearchVC {
    func searchMovies(){
        self.movies = MovieService.shared.searchMovies()
        self.tableView.reloadData()
    }
}

extension SearchVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.movie = self.movies[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
