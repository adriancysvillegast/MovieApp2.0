//
//  HomeViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject{
    func showError(message: String)
    func reload()
}

class HomeViewModel{

    //MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    
    /**Top Movie properties **/
    var topMovieService: TopMovieFetching?
    var topMoviesArray: [Movie] = []
    
    init(service: TopMovieFetching = TopMovieService()){
        self.topMovieService = service
    }
    
    //MARK: - Top Movies Methods
    func getTopMovies(){
        DispatchQueue.global().async {
            self.topMovieService?.fetchTopMovies(onComplete: { movies in
                self.topMoviesArray = movies
                self.delegate?.reload()
            }, onError: {
                print("error getting data")
                self.delegate?.showError(message: Constants.ErrorMessages.didError)
            })
        }
    }
    
    func getTopMovie(index: Int) -> Movie {
        return topMoviesArray[index]
    }
    
    func getTopMovieCount() -> Int {
        return topMoviesArray.count
    }
    
    
}
