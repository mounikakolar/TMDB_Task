//
//  ViewController.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

   private let viewModel = MoviesListViewModel()

   @IBOutlet weak var moviesListTableView: UITableView!
   @IBOutlet weak var searchBar: UISearchBar!


   override func viewDidLoad() {
      super.viewDidLoad()
      self.viewModel.fetchMoviesList {
         self.moviesListTableView.reloadData()
      }
   }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.viewModel.filteredMovies.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
      movieCell.movie = self.viewModel.filteredMovies[indexPath.row]
      return movieCell
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.navigateToMovieDetails(movieId: self.viewModel.filteredMovies[indexPath.row].id)
   }

   private func navigateToMovieDetails(movieId: Int) {
      if let movieDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "movieDetails") as? MovieDetailsViewController {
         movieDetailsViewController.movieId = movieId
         self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
      }
   }

   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      self.viewModel.searchMoviesNames(name: searchText)
      self.moviesListTableView.reloadData()
   }

}

