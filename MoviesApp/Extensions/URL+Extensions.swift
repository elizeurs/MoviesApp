//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Elizeu RS on 26/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
  
  static func forMoviesByName(_ name: String) -> URL? {
    return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(API.key)")
  }
}

