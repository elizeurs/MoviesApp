//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Elizeu RS on 28/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
  
  let imdbId: String
  @ObservedObject var movieDetailVM = MovieDetailViewModel()
  
    var body: some View {
      VStack {
        
        if movieDetailVM.loadingState == .loading {
          LoadingView()
        } else if movieDetailVM.loadingState == .success {
          // MovieDetailView
          MovieDetailView(movieDetailVM: movieDetailVM)
        } else if movieDetailVM.loadingState == .failed {
          FailedView()
        }
      }
      
      .onAppear {
        self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
      }
    }
}

//struct MovieDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailScreen()
//    }
//}
