//
//  GenreService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 31/7/22.
//

import Foundation

protocol GenreFeching{
    func get(onComplete: @escaping ([Genres]) -> (), onError: @escaping (String) -> () )
}

class GenreService: GenreFeching {
    
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    private let endpointGenre = ProcessInfo.processInfo.environment["endpointGenre"]!
    private let apiKey = ProcessInfo.processInfo.environment["apiKey"]!
    
    func get(onComplete: @escaping ([Genres]) -> (), onError: @escaping (String) -> ()) {
        CallAPI.shared.get(url: "\(baseURL)\(endpointGenre)api_key=\(apiKey)") { response in
            switch response {
            case .success(let data):
                guard let safeData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    let genresData = try decoder.decode(GenreMovie.self, from: safeData)
                    onComplete(genresData.genres)
                }catch{
                    onError(error.localizedDescription)
                }
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
    }
    
    
}
