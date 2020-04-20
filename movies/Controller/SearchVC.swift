//
//  SearchVC.swift
//  movies
//
//  Created by Cleber Reis on 20/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let cellId = "cellId"
    var movies: [Movie] = []
    var moviesSearch: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        
        self.configSearchBar()
        self.searchMovies()
        
        moviesSearch = movies
    }
    
    func configSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Descubra novo filmes"
        searchController.searchBar.delegate = self
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
        return moviesSearch.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.movie = self.movies[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let movie = self.movies[indexPath.item]
        let movieDetailVC = MovieDetailVC()
        movieDetailVC.movie = movie
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            moviesSearch = movies
            tableView.reloadData()
            return
        }

        moviesSearch = movies.filter({ (movie) -> Bool in
            movie.title.lowercased().contains(searchText.lowercased())
        })
        
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        moviesSearch = movies
        tableView.reloadData()
    }
    
}
