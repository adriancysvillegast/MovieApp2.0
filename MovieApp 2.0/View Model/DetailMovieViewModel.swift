//
//  DetailMovieViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 26/4/22.
//

import Foundation
import RealmSwift
import Alamofire

protocol DetailMovieViewModelDelegate{
    func presentError(error: UIAlertController)
}

class DetailMovieViewModel{
    
    var localReal = try! Realm()
    var optionSelected : Results<ItemSelected>?
    let alerts = ShowAlertsViewController()
    var delegate : DetailMovieViewModelDelegate?
    
    var refresh = { () -> () in }
    var detailMovie : [DetailModel] = []{
        didSet{
            refresh()
        }
    }
    
    //MARK: - FetchData
    func fetchData(){
        
        if let id = optionSelected?[0].id{
            let urlRequest = "\(Constants.API.Urls.urlSearcMoviePart1)\(id)\(Constants.API.Urls.urlSearcMoviePart2)"
            
            AF.request(urlRequest, requestModifier:{
                $0.timeoutInterval = 120
            }).responseDecodable(of: DetailMovieModel.self) { response in
                
                if let safeData = response.data{
                    DispatchQueue.main.async {
                        
                        self.parseJSON(data: safeData)
                    }
                    
                }else {
                    let message = "Error Fetching data from API, please try again later"
                    let alert = self.alerts.showAlert(message: message)
                    self.delegate?.presentError(error: alert)
                }
                
                
            }
            
        }else{
            let message = "Ups, We Cannot get the id of the movie"
            let alert = alerts.showAlert(message: message)
            self.delegate?.presentError(error: alert)
        }
    }
    //MARK: - ParseJSON
    func parseJSON(data: Data){
        do{
            let value = try JSONDecoder().decode(DetailMovieModel.self, from: data)
            let adult = value.adult
            let budget = value.budget
            let genres = value.genres[0].name
            let idMovie = value.id
            let originalLenguage = value.original_language
            let originalTitle = value.original_title
            let overview = value.overview
            let popularity = value.popularity
            let productionCompanies = value.production_companies[0].name
            let productionCountries = value.production_countries[0].name
            let releaseDate = value.release_date
            let runtime = value.runtime
            let spokenLanguages = value.spoken_languages[0].name
            let status = value.status
            let voteAverage = value.vote_average
            let voteCount = value.vote_count
            let colorBackgroud = optionSelected?[0].colorHex ?? "#000000"
            
            let detailsObject = DetailModel(adult: adult, budget: budget, genres: genres, id: idMovie, original_language: originalLenguage, original_title: originalTitle, overview: overview, popularity: popularity, production_companies: productionCompanies, production_countries: productionCountries, release_date: releaseDate, runtime: runtime, spoken_languages: spokenLanguages, status: status, vote_average: voteAverage, vote_count: voteCount, colorBackground: colorBackgroud)
            
            self.detailMovie.append(detailsObject)
            
        }catch let e{
            
            let alert = alerts.showAlert(message: e.localizedDescription)
            self.delegate?.presentError(error: alert)
        }
    }
    
    
    //MARK: - Manipulation Methods
    func load(){
        optionSelected = localReal.objects(ItemSelected.self)
    }
}
