//
//  DetailMovieViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/7/22.
//

import Foundation

protocol DetailMovieViewModelDelegate: AnyObject {
    func updateView(movie: MovieDetails)
    func showError(message: String)
    func showProperties()
    func hideProperties()
    func updateImage(data: Data)
    func updateGenre(genre: [String])
}

class DetailMovieViewModel {
    
    //MARK: - Properties
    
    weak var delegate : DetailMovieViewModelDelegate?
    weak var delegateSpinner : SpinnerLoadDelegate?
    private var service : DetailMovieFeching?
    
    init(serviceDetail: DetailMovieFeching = DetailMovieService()){
        self.service = serviceDetail
    }
    
    //MARK: - Get detail Movie
    func getDetailMovie(movie: Int?) {
        self.delegateSpinner?.showSpinner()
        self.delegate?.hideProperties()
        guard let dataMovie = movie else { return }
        service?.detailMovieFetch(nameMovie: dataMovie, onComplete: { infoMovie in
            self.updateMovie(movie: infoMovie)
            self.delegate?.updateView(movie: infoMovie)
            self.delegateSpinner?.hideSpinner()
            self.delegate?.showProperties()
        }, onError: {
            self.delegateSpinner?.hideSpinner()
            self.delegate?.showError(message: Constants.ErrorMessages.didError)
        })
    }
    

    private func updateMovie(movie: MovieDetails) {
        updateImage(movie: movie)
        updateGenres(movie: movie)
    }
    
    private func updateImage(movie: MovieDetails) {
        let imageURL = ProcessInfo.processInfo.environment["imageURL"]!
        if movie.posterPath != nil{
            guard let url = URL(string: "\(imageURL)\(movie.posterPath!)") else { return }
            do{
                let data = try Data(contentsOf: url)
                self.delegate?.updateImage(data: data)
            }catch{
                self.delegate?.showError(message: Constants.ErrorMessages.didErrorImage)
            }
        }
    }
    
    private func updateGenres(movie: MovieDetails) {
        var stringValue = [String]()
        let movieGenre = movie.genres
        for movieGenre in movieGenre {
            stringValue.append(movieGenre.name)
        }
        self.delegate?.updateGenre(genre: stringValue)
    }
}
