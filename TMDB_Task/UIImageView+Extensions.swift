//
//  UIImageView+Extensions.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

extension UIImageView {

   func loadImageFrom(urlLastPath: String) {
      self.image = nil
      let tmdbImagePath = "http://image.tmdb.org/t/p/w185"
      DispatchQueue.global(qos: .userInitiated).async {
         let imageUrlPath = tmdbImagePath + urlLastPath
         guard let imageUrl = URL(string: imageUrlPath), let imageData = try? Data(contentsOf: imageUrl), let movieImage = UIImage(data: imageData) else { return }
         DispatchQueue.main.async {
            self.image = movieImage
         }
      }
   }

}



