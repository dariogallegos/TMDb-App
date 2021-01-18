//
//  HomeViewModel.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    init() {
        getMovies()
    }
    
    //TODO propiedad computada que csarga la información
    /*var movies = Movies.self {
        didSet {
            didChange.send(self)
        }
    }*/
    
    @Published var movies = [Movie]() {
        willSet {
            didChange.send(self)
        }
    }
    
    //TODO PONER GESTINADOR DE ERROES
    //un passthrought  es similar a notication center. Es parecido pero bajo el paradigma de combine
    //1 quien esta gestionado la emision de datos. En este caso PostListViewModel
    //2 gestion de errores, para este caso ponemos never porque no vamos a lanzar erroes
    
    let didChange = PassthroughSubject <HomeViewModel, Never>()
    
    func getMovies(){
        NetworkManager().getPopularMovies { movies in
            self.movies = movies
        }
    }
}
