//
//  URLImage.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 17/1/21.
//

import SwiftUI
import Combine

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url:String, placeholder:String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadedImage(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        else{
            return Image("placeholder").resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://harrycha.com/wp-content/uploads/2020/04/swiftui.png")
    }
}
