//
//  DetailMovieService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 20/7/22.
//

import Foundation

protocol DetailMovieFeching {
    func detailMovieFetch(nameMovie: Int, onComplete: @escaping (MovieDetails) -> (), onError: @escaping () -> ())
}

class DetailMovieService: DetailMovieFeching {
    //MARK: - Properties
    
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    private let endpointSearch = ProcessInfo.processInfo.environment["endpointSearchMovie"]!
    let token = Constants.API.APIKey.keyValue
    
    //MARK: - Service
    func detailMovieFetch(nameMovie: Int, onComplete: @escaping (MovieDetails) -> (), onError: @escaping () -> ()) {
        CallAPI.shared.get(url: "\(baseURL)\(endpointSearch)\(nameMovie)?api_key=\(token)") { response
            in
            switch response{
            case .success(let data):
                guard let safeData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let details = try decoder.decode(MovieDetails.self, from: safeData)
                    onComplete(details)
                }catch{
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
}
