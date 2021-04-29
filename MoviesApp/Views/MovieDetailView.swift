//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Elizeu RS on 28/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
  
  let movieDetailVM: MovieDetailViewModel
  
  var body: some View {
    ScrollView {
      
      VStack(alignment: .leading, spacing: 10) {
        URLImage(url: movieDetailVM.poster)
          .cornerRadius(10)
        
        Text(movieDetailVM.title)
          .font(.title)
        Text(movieDetailVM.plot)
        Text("Director")
          .fontWeight(.bold)
        Text(movieDetailVM.director)
        HStack {
          Rating(rating: .constant(movieDetailVM.rating))
          Text("\(movieDetailVM.rating)/10")
        }.padding(.top, 10)
        
        Spacer()
      }.padding()
      
      .navigationBarTitle(self.movieDetailVM.title)
    }
  }
}

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    
    let movieDetail = MovieDetail(title: "Batman Begins", year: "2005", rated: "PG-13", plot: "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.", director: "Christopher Nolan", actors: "", imdbRating: "8.2", poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", imdbId: "tt0372784")
    
    return MovieDetailView(movieDetailVM: MovieDetailViewModel(movieDetail: movieDetail))
      .embedNavigationView()
  }
}
