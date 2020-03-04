//
//  MovieDetailsModel.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

struct MovieDetails: Codable {
   let adult: Bool?
   let backdropPath: String?
   let budget: Int?
   let genres: [Genre]?
   let homepage: String?
   let id: Int?
   let imdbID, originalLanguage, originalTitle, overview: String?
   let popularity: Double?
   let posterPath: String?
   let releaseDate: String?
   let revenue, runtime: Int?
   let spokenLanguages: [SpokenLanguage]?
   let status, tagline, title: String?
   let video: Bool?
   let voteAverage: Double?
   let voteCount: Int?

   enum CodingKeys: String, CodingKey {
      case adult
      case backdropPath = "backdrop_path"
      case budget, genres, homepage, id
      case imdbID = "imdb_id"
      case originalLanguage = "original_language"
      case originalTitle = "original_title"
      case overview, popularity
      case posterPath = "poster_path"
      case releaseDate = "release_date"
      case revenue, runtime
      case spokenLanguages = "spoken_languages"
      case status, tagline, title, video
      case voteAverage = "vote_average"
      case voteCount = "vote_count"
   }
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct SpokenLanguage: Codable {
    let iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case name
    }
}
