//
//  MovieTableViewCell.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

   @IBOutlet weak var posterImageView: UIImageView!
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var ratingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

   var movie: Movie? {
      didSet {
         self.posterImageView.loadImageFrom(urlLastPath: self.movie?.posterPath ?? "")
         self.titleLabel.text = self.movie?.title
         self.ratingLabel.text = self.movie?.voteAverage?.description
      }
   }

}
