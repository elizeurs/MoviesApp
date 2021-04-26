//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Elizeu RS on 26/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case badURL
  case noData
  case decodingError
}

class HTTPClient {
  
  func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
    
//    guard let url = URL(string: "http://www.omdbapi.com/?s=batman&apikey=\(API.key)") else {
//      return completion(.failure(.badURL))
//    }
    
    guard let url = URL.forMoviesByName(search) else {
      return completion(.failure(.badURL))
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard let data = data, error == nil else {
        return completion(.failure(.noData))
      }
      
      guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
        return completion(.failure(.decodingError))
      }
      
      completion(.success(moviesResponse.movies))
    }.resume()
  }
}
