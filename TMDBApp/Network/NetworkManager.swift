//
//  NetworkManager.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import Foundation

class NetworkManager {
    
    //Vamos a usar URLSession (técnologia de Swift) que para realizar esto es suficiente. Podemos usar otros como Alamofire si fuera más complejo

    func getPopularMovies(completion: @escaping([Movie]) -> ()){
        
        let session = URLSession.shared
        var request = URLRequest (url:URL(string: Constants.URL.main + Constants.Endpoints.urlListPopularMovies + Constants.apiKey)!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let listOfMovies = try decoder.decode(Movies.self, from: data)
                    DispatchQueue.main.async {
                        completion(listOfMovies.results)
                    }

                } catch let error {
                    print("Error: \(error.localizedDescription)")
                }
            }
            else if response.statusCode == 401 {
                print("Error 401")
            }
            
        }.resume()
        
    }
    
    /*func getDetailMovie(movieID:String, completion:@escaping(MovieDetail) -> ()) {
        
        let session = URLSession.shared
        var request = URLRequest (url:URL(string: Constants.URL.main + Constants.Endpoints.urlDetailMovie + movieID + Constants.apiKey)!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let detailMovie = try decoder.decode(MovieDetail.self, from: data)
                    DispatchQueue.main.async {
                        completion(detailMovie)
                    }

                } catch let error {
                    print("Error: \(error.localizedDescription)")
                }
            }
            else if response.statusCode == 401 {
                print("Error 401")
            }
            
        }.resume()
    }*/
    
}
