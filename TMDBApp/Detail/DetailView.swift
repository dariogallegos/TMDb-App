//
//  DetailView.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import SwiftUI

struct DetailView: View {
    
    private let screenWidth = UIScreen.main.bounds.size.width
    
    var image: String
    var title: String
    var sinopsis: String
    var releaseDate: String
    var voteAverage: Double
    
    
    var body: some View {
        VStack(alignment: .center){
            URLImage(url: Constants.URL.urlImages + image)
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth, height: screenWidth, alignment: .center)
                .clipShape(Rectangle())
                .overlay(
                    ZStack {
                        Text(title)
                            .bold()
                            .font(.title)
                            .padding(.leading,20)
                            .padding(.top,5)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 45, alignment: Alignment.leading)
                    .background(Color("Background"))
                    , alignment: .bottomLeading
                )
            
            HStack(alignment: .center, spacing: 20) {
                Text("\(String(voteAverage)) of vote average")
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: screenWidth*0.5, minHeight:20, maxHeight: .infinity, alignment: .leading)
                Text(releaseDate)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: screenWidth*0.4, minHeight:20, maxHeight: .infinity, alignment: .trailing)
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight:40, alignment: Alignment.leading)
            .padding(.horizontal,20)
            .padding(.vertical, 5)
            
            Text(sinopsis)
                .padding(.horizontal,20)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth:.infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: Alignment.top)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "placeholer",
                   title: "Title",
                   sinopsis: "Sinopsis",
                   releaseDate: "1972",
                   voteAverage: 0)
    }
}
