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
    var isSearch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
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
        
        if !isSearch {
            return movies.count
        } else {
            let count = self.moviesSearch.count
            if count == 0 {
                let textLabel: UILabel = {
                    let label = UILabel()
                    label.text = "Não foi encontrado nenhum filme."
                    label.textAlignment = .center
                    label.textColor = .darkText
                    label.font = UIFont.systemFont(ofSize: 16)
                    label.numberOfLines = 0
                    
                    return label
                }()
                
                tableView.backgroundView = textLabel
                
            } else {
                tableView.backgroundView = nil
            }
            
            return count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        
        if !isSearch {
            cell.movie = self.movies[indexPath.row]
        } else {
            cell.movie = self.moviesSearch[indexPath.row]
        }
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
            self.isSearch = false
            tableView.reloadData()
            return
        }
        
//        moviesSearch = movies.filter({$0.title.lowercased().contains(searchText.lowercased())})
        
        moviesSearch = movies.filter({ (movie) -> Bool in
            movie.title.lowercased().contains(searchText.lowercased())
        })
        
        if moviesSearch.count > 0 {
            self.isSearch = true
        } else {
//            self.isSearch = false
        }

        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        moviesSearch = movies
        tableView.reloadData()
    }

}
