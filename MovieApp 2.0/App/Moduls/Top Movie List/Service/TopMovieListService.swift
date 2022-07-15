//
//  TopMovieListService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 10/7/22.
//

import Foundation

class TopMovieListService{
    
    func getTopMovie(onComplete: @escaping ([Movie]) -> Void, onError: @escaping ()-> Void) {

        CallAPI.shared.get(url: Constants.API.Urls.urlTopMovies) { response in
            
            switch response{
            case .success(let data):
                do{
                    guard let data = data else {return}
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let topMovies = try decoder.decode(Movies.self, from: data)
                    onComplete(topMovies.results)
                }catch{
                    onError()
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
