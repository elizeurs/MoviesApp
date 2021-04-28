//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Elizeu RS on 27/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
  
  func trimmedAndEscaped() -> String {
    
    let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
    return
      trimmedString
      .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
}
