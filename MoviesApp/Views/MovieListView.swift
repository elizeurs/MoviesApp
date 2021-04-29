//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Elizeu RS on 27/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
  
  let movies: [MovieViewModel]
  
  var body: some View {
    List(self.movies, id: \.imdbId) { movie in
      NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
        MovieCell(movie: movie)
      }
    }
  }
}

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView(movies: [MovieViewModel]())
  }
}

struct MovieCell: View {
  
  let movie: MovieViewModel
  
  var body: some View {
    HStack(alignment: .top) {
      URLImage(url: movie.poster)
        .frame(width: 100, height: 120)
        .cornerRadius(6)
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.headline)
        
        Text(movie.year)
          .opacity(0.5)
          .padding(.top, 10)
      }.padding(5)
      Spacer()
    }.contentShape(Rectangle())
  }
}
