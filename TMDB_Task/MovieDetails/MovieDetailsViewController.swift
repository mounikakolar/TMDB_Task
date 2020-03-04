//
//  MovieDetailsViewController.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

   var movieId: Int = 0

   @IBOutlet weak var imageView: UIImageView!
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var durationLabel: UILabel!
   @IBOutlet weak var releaseDate: UILabel!
   @IBOutlet weak var languagesLabel: UILabel!
   @IBOutlet weak var genreLabel: UILabel!
   @IBOutlet weak var ratingLabel: UILabel!
   @IBOutlet weak var aboutLabel: UILabel!
   @IBOutlet weak var castLabel: UILabel!

   private let viewModel = MovieDetailsViewModel()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Movie Details"
      self.viewModel.fetchMoviesDetails(movieId: self.movieId) {
         self.assignMovieDetails()
      }
   }

   private func assignMovieDetails() {
      self.imageView.loadImageFrom(urlLastPath: self.viewModel.movieDetails?.backdropPath ?? "")
      self.titleLabel.text = self.viewModel.movieDetails?.title
      self.durationLabel.text = (self.viewModel.movieDetails?.runtime?.description ?? "") + " min."
      self.releaseDate.text = self.viewModel.movieDetails?.releaseDate
      let languages = self.viewModel.movieDetails?.spokenLanguages?.compactMap({ (spokenLanguage) -> String? in
         return spokenLanguage.name
      })
      self.languagesLabel.text = languages?.joined(separator: ", ")

      let genres = self.viewModel.movieDetails?.genres?.compactMap({ (genre) -> String? in
         return genre.name
      })
      self.genreLabel.text = genres?.joined(separator: ", ")

      let rating = self.viewModel.movieDetails?.voteAverage?.description ?? ""
      let votes = self.viewModel.movieDetails?.voteCount?.description ?? ""
      self.ratingLabel.text = rating + " & " + votes + " votes"
      self.aboutLabel.text = self.viewModel.movieDetails?.overview
      self.castLabel.text = self.viewModel.movieDetails?.tagline
   }
    
}
