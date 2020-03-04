//
//  APIManager.swift
//  TMDB_Task
//
//  Created by Mounika on 03/03/20.
//  Copyright © 2020 Mounika. All rights reserved.
//

import UIKit

class APIManager {

   static let sharedInstance = APIManager()

   private let tmdbApiKey = "f32df30db7c98c773b1bfffdefc94457"
   private let tmdbUrl = "https://api.themoviedb.org/3/movie/"


   func callApi<Decode: Codable>(urlLastPath: String, decodeType: Decode.Type, callBack: @escaping (Result<Decode, Error>) -> ()) {

      let completeUrlPath = self.tmdbUrl + urlLastPath + "?api_key=" + tmdbApiKey

      guard let apiUrl = URL(string: completeUrlPath) else {
         let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
         callBack(.failure(error))
         return
      }

      let urlRequest = URLRequest(url: apiUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)

      URLSession(configuration: .default).dataTask(with: urlRequest) { (data, response, error) in

         if let error = error {
            callBack(.failure(error))
            return
         }
         if let data = data {
            do {
               let generic = try JSONDecoder().decode(decodeType, from: data)
               DispatchQueue.main.async {
                  callBack(.success(generic))
               }
            } catch let genericError {
               callBack(.failure(genericError))
            }
         }

      }.resume()

   }


}
