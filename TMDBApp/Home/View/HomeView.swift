//
//  ContentView.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import SwiftUI
import CoreData
import UIKit

struct HomeView: View {
    
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @ObservedObject var model = HomeViewModel()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(model.movies) { movie in
                            NavigationLink(destination: DetailView(image: movie.image,
                                                                   title: movie.title,
                                                                sinopsis: movie.sinopsis,
                                                             releaseDate: movie.releaseDate,
                                                             voteAverage: movie.voteAverage)) {
                                MovieCell(movie: movie)
                            }
                        }
                    }
                }
                .navigationBarTitle("Popular in TMDb")
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .dark)
    }
}


struct MovieCell: View {
    let movie: Movie
    var body: some View {
        
        ZStack {
            HStack(alignment: .center) {
                URLImage(url: Constants.URL.urlImages + movie.image)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                    .padding()
            }
        }
    }
}
