//
//  GenreViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 31/7/22.
//

import Foundation

protocol GenreViewModelDelegate: AnyObject {
    func reloadData()
    func showError(message: String)
    func showProperties()
    func hideProperties()
}

class GenreViewModel {
    //MARK: - Properties
    
    private var service: GenreFeching?
    weak var delegate: GenreViewModelDelegate?
    weak var delegateSpinner: SpinnerLoadDelegate?

    var genresArray: [Genres] = []
    
    init(service: GenreService = GenreService()) {
        self.service = service
    }
    
    //MARK: - getGenres
    
    func getGenres() {
        self.delegateSpinner?.showSpinner()
        service?.get(onComplete: { genres in
            self.genresArray = genres
            self.delegateSpinner?.hideSpinner()
            self.delegate?.showProperties()
            self.delegate?.reloadData()
        }, onError: { error in
            self.delegateSpinner?.hideSpinner()
            self.delegate?.showError(message: Constants.ErrorMessages.didErrorGenre)
        })
    }
    
    
    func genresCount() -> Int {
        return genresArray.count
    }
    
    func showGenres(index: Int) -> Genres {
        return genresArray[index]
    }
}
