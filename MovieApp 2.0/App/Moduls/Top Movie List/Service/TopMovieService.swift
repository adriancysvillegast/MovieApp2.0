//
//  TopMovieService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 10/7/22.
//

import Foundation

protocol TopMovieFeching{
    func topMovieFetch(onComplete: @escaping ([Movie]) -> (), onError: @escaping () -> () )
}

class TopMovieService: TopMovieFeching{
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    private let endpointTopMovie = ProcessInfo.processInfo.environment["endpointTopMovie"]!
    
    func topMovieFetch(onComplete: @escaping ([Movie]) -> (), onError: @escaping () -> ()) {
        CallAPI.shared.get(url: ("\(baseURL)\(endpointTopMovie)api_key=\(Constants.API.APIKey.keyValue)")) { response in
            switch response {
            case .success(let data):
                guard let safeData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let topMovie = try decoder.decode(Movies.self, from: safeData)
                    onComplete(topMovie.results)
                }catch{
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
    
}
