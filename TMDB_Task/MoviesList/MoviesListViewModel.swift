//
//  MoviesListViewModel.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class MoviesListViewModel {

   private var movies: [Movie] = []
   var filteredMovies: [Movie] = []

   func fetchMoviesList(callBack: @escaping () -> ()) {
      APIManager.sharedInstance.callApi(urlLastPath: "now_playing", decodeType: MoviesList.self) { (result) in
         switch result {
         case .success(let response):
            self.movies = response.movies ?? []
            self.filteredMovies = self.movies
            callBack()
         case .failure(let error):
            print(error.localizedDescription)
         }
      }
   }

   func searchMoviesNames(name: String) {
      self.filteredMovies = name.isEmpty ? self.movies : self.movies.filter({ $0.title.contains(name) })
   }

}
