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
         guard let imageUrl = URL(string: imageUrlPath) else { return }

         if let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imageLocalUrl = documentUrl.appendingPathComponent(imageUrl.lastPathComponent)
            if FileManager.default.fileExists(atPath: imageLocalUrl.path), let image = UIImage(contentsOfFile: imageLocalUrl.path) {
               DispatchQueue.main.async {
                  self.image = image
               }
            } else if let imageData = try? Data(contentsOf: imageUrl), let movieImage = UIImage(data: imageData) {
               try? imageData.write(to: documentUrl)
               DispatchQueue.main.async {
                  self.image = movieImage
               }
            }
         }
      }
   }

}



