//
//  Movie.swift
//  MoviesApp
//
//  Created by Elizeu RS on 26/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
  let movies: [Movie]
}

struct Movie: Codable {
  let title: String
  let year: String
  let imdbId: String
  let poster: String
  
  private enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbId = "imdbID"
    case poster = "Poster"
  }
}
