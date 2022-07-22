//
//  TopMovieViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 10/7/22.
//

import Foundation

protocol TopMovieViewModelDelegate: AnyObject {
    func reloadData()
    func didError(message: String)
    func hideProperties()
    func showProperties()
}

class TopMovieViewModel{
    
    //MARK: - Properties
    weak var delegate : TopMovieViewModelDelegate?
    weak var delegateSpinner : SpinnerLoadDelegate?
    
    private var service : TopMovieFeching?
    var topMovies: [MovieModel] = []
    
    init(serviceTop: TopMovieFeching = TopMovieService()){
        self.service = serviceTop
    }
    //MARK: - GetTopMovie
    func getTopMovie() {
        self.delegateSpinner?.showSpinner()
        service?.topMovieFetch(onComplete: { movies in
            
            self.getDataImage(movies: movies)
            self.delegate?.reloadData()
            self.delegateSpinner?.hideSpinner()
        }, onError: {
            self.delegateSpinner?.hideSpinner()
            self.delegate?.didError(message: Constants.ErrorMessages.didError)
        })
    }
    
    //MARK: - getImage
    
    func getDataImage(movies: [Movie]) {
        let imageURL = ProcessInfo.processInfo.environment["imageURL"]!
        for movie in movies {
            guard let movieImageUrl = movie.posterPath else {return}
                
            if let url = URL(string: "\(imageURL)\(movieImageUrl)"){
                do{
                    let data = try Data(contentsOf: url)
                    let newMovie = MovieModel(posterPath: movie.posterPath, adult: movie.adult, overview: movie.overview, id: movie.id, originalTitle: movie.originalTitle, dataImage: data)
                    self.topMovies.append(newMovie)
                }catch{
                    let message = "We couldn't get all images"
                    self.delegate?.didError(message: message)
                }
            }
        }
    }
    
    //MARK: - ShowData
    
    func showTopMovie(index: Int) -> MovieModel {
        return topMovies[index]
    }
    
    func topMoviesCount() -> Int {
        return topMovies.count
    }
}
