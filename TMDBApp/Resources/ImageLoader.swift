//
//  ImageLoader.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 17/1/21.
//

import Foundation
import SwiftUI
import Combine


/*class ImageLoader: ObservableObject {
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    @Published var image: UIImage?

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }
       
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
                   .map { UIImage(data: $0.data) }
                   .replaceError(with: nil)
                   .receive(on: DispatchQueue.main)
                   .sink { [weak self] in self?.image = $0 }
    }

    func cancel() {
        cancellable?.cancel()
    }
}*/

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadedImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
        
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.sync {
                self.downloadedData = data
            }
        }.resume()

    }
}
