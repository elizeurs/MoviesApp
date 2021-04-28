//
//  FailedView.swift
//  MoviesApp
//
//  Created by Elizeu RS on 27/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
      VStack {
        Image("oops")
            .resizable()
          .aspectRatio(contentMode: .fit)
        
        Spacer()
        
      }
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
