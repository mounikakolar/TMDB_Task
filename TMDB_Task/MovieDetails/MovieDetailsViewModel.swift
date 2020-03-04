//
//  MovieDetailsViewModel.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class MovieDetailsViewModel {

   var movieDetails: MovieDetails?

   func fetchMoviesDetails(movieId: Int, callBack: @escaping () -> ()) {
      APIManager.sharedInstance.callApi(urlLastPath: movieId.description, decodeType: MovieDetails.self) { (result) in
         switch result {
         case .success(let response):
            self.movieDetails = response
            callBack()
         case .failure(let error):
            print(error.localizedDescription)
         }
      }
   }

}
