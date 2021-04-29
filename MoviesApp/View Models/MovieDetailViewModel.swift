//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Elizeu RS on 28/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
  
  private var movieDetail: MovieDetail?
  @Published var loadingState = LoadingState.loading
  
  private var httpClient = HTTPClient()
  
  init(movieDetail: MovieDetail? = nil) {
    self.movieDetail = movieDetail
  }
  
  func getDetailsByImdbId(imdbId: String) {
    
    httpClient.getMovieDetailsBy(imdb: imdbId) { result in
      switch result {
      case .success(let details):
        // whenever you're trying to set a "@Published" property, make sure you do it on the main thread.
        DispatchQueue.main.async {
          self.movieDetail = details
          self.loadingState = .success
        }
        
      case .failure(let error):
        print(error.localizedDescription)
        DispatchQueue.main.async {
          self.loadingState = .failed
        }
      }
    }
  }
  
  var title: String {
    self.movieDetail?.title ?? ""
  }
  
  var poster: String {
    self.movieDetail?.poster ?? ""
  }
  
  var plot: String {
    self.movieDetail?.plot ?? ""
  }
  
  var rating: Int {
    get {
      let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
      return Int(ceil(ratingAsDouble ?? 0.0))
    }
  }
  
  var director: String {
    return movieDetail?.director ?? ""
  }
}
