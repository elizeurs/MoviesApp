//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Elizeu RS on 27/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
  
  func embedNavigationView() -> some View {
    return  NavigationView {  self }
  }
}
