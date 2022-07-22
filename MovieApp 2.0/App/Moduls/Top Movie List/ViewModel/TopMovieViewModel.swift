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
}

class TopMovieViewModel{
    
    //MARK: - Properties
    private var service = TopMovieListService()
    var topMovies: [Movie] = []
    weak var delegate: TopMovieViewModelDelegate?
    
    //MARK: - GetTopMovie
    func getTopMovie(){
        service.getTopMovie(onComplete: { movies in
            self.topMovies = movies
            self.delegate?.reloadData()
        }, onError: {
            
            self.delegate?.didError(message: Constants.ErrorMessages.didError)
        })
    }
    
    //MARK: - getImage
    
    func getImage(id: Int){
    }
    
    //MARK: - ShowData
    
    func showTopMovie(index: Int) -> Movie{
        return topMovies[index]
    }
    
    func topMoviesCount() -> Int {
        return topMovies.count
    }
}