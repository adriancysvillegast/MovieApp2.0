//
//  TopMovieService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import Foundation

protocol TopMovieFetching{
    func fetchTopMovies(onComplete: @escaping ([Movie]) -> (), onError: @escaping () -> () )
}

class TopMovieService: TopMovieFetching {
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    
    func fetchTopMovies(onComplete: @escaping ([Movie]) -> (), onError: @escaping () -> ()) {
        CallAPI.shared.get(url: "\(baseURL)\(Constants.API.Urls.endpointTopMovie)") { response in
            
            switch response{
            case .success(let data):
                do{
                    guard let safeData = data else { return}
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let topMovies = try decoder.decode(Movies.self, from: safeData)
                    
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
