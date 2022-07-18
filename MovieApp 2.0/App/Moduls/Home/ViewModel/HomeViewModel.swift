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
    func hideView()
    func showView()
}

class HomeViewModel{

    //MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    weak var delegateSpinner : SpinnerLoadDelegate?
    /**Top Movie properties **/
    var topMovieService: TopMovieFetching?
    var topMovieData: [MovieData] = []
    /**Categories properties **/
    init(serviceTopMovie: TopMovieFetching = TopMovieService() ){
        self.topMovieService = serviceTopMovie
    }
    
    //MARK: - Top Movies Methods
    func getTopMovies() {
        self.delegate?.hideView()
        self.delegateSpinner?.showSpinner()
        DispatchQueue.global().async {
            self.topMovieService?.fetchTopMovies(onComplete: { movies in
                self.createMovieData(movies: movies)
                self.delegate?.reload()
                self.delegateSpinner?.hideSpinner()
                self.delegate?.showView()
            }, onError: {
                self.delegate?.showError(message: Constants.ErrorMessages.didError)
                self.delegateSpinner?.hideSpinner()
            })
        }
    }
    
    func createMovieData(movies: [Movie]) {
        let imageURL = ProcessInfo.processInfo.environment["imageURL"]!
        
        for movie in movies{
            if let url = URL(string: "\(imageURL)\(movie.posterPath)"){
                do{
                    let data = try Data(contentsOf: url)
                    let newMovie = MovieData(posterPath: movie.posterPath, adult: movie.adult, overview: movie.overview, id: movie.id, originalTitle: movie.originalTitle, dataImage: data)
                    topMovieData.append(newMovie)
                }catch{
                    self.delegate?.showError(message: Constants.ErrorMessages.didError)
                }
            }
        }
    }
    
    func getTopMovie(index: Int) -> MovieData {
        return topMovieData[index]
    }
    
    func getTopMovieCount() -> Int {
        return topMovieData.count
    }
    
    
    //MARK: - Look info
    func lookMovie(index: Int) -> Int{
        topMovieData[index].id
    }
    
    //MARK: - Trending
   
    
}
