//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Elizeu RS on 26/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

class MovieListViewModel: ViewModelBase {
  
  @Published var movies = [MovieViewModel]()
  let httpClient = HTTPClient()
  
  func searchByName(_ name: String) {
    
    if name.isEmpty {
      return
    }
    // Lord of the Rings
    // Lord%20of%20the%20Rings
    
    self.loadingState = .loading
    
    httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
      switch result {
      case.success(let movies):
        if let movies = movies {
          DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
              self.loadingState = .success
          }
        }
      case .failure(let error):
        print(error.localizedDescription)
        DispatchQueue.main.async {
          self.loadingState = .failed
        }
      }
    }
  }
}

struct MovieViewModel {
  
  let movie: Movie
  
  var  imdbId: String {
    movie.imdbId
  }
  
  var title: String {
    movie.title
  }
  
  var poster: String {
    movie.poster
  }
  
  var year: String {
    movie.year
  }
}
