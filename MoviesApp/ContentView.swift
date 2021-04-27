//
//  ContentView.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

// not the rootView anymore. MovieListScreen is the current rootView.
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
      
      // we will remove this code. only for testing the http client
          .onAppear {
            HTTPClient().getMoviesBy(search: "batman") { result in
              switch result {
              case .success(let movies):
                print(movies)
              case .failure(let error):
                print(error.localizedDescription)
              }
            }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
