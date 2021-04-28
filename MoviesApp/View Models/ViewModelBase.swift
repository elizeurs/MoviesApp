//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Elizeu RS on 27/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
  case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
  @Published var loadingState: LoadingState = .none
}
