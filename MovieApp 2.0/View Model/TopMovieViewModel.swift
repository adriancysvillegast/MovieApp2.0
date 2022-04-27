//
//  TopMovieViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation
import Alamofire
import RealmSwift
import ChameleonFramework

protocol TopMovieViewModelDelegate{
    func presentError(alert: UIAlertController)
}

class TopMovieViewModel{
    
    let localRealm = try! Realm()
    let alerts = ShowAlertsViewController()
    var delegate : TopMovieViewModelDelegate?
    
    var refresh = { ()-> () in }
    var topMovieArray : [MovieModel] = []{
        didSet{
            refresh()
        }
    }
    //MARK: - fetchData
    func fetchDataTopMovie() {
        //        clean array
        topMovieArray = []
        
        for index in 1...1{ //5
            
            let urlRequest = "\(Constants.API.Urls.urlTopMovies)\(index)"
            
            AF.request(urlRequest, requestModifier: {
                $0.timeoutInterval = 120
            }).responseDecodable(of: TopMovieModel.self) { response in
                
                if let safeData = response.data{
                    DispatchQueue.main.async {
                        self.parseJSON(safeData: safeData)
                    }
                } else{
                    let message = "Error Fetching data from API, please try again later"
                    let alert = self.alerts.showAlert(message: message)
                    self.delegate?.presentError(alert: alert)
                }
            }
        }
    }
    
    //MARK: - ParseJSON
    func parseJSON(safeData: Data){
        
        do{
            let value = try JSONDecoder().decode(TopMovieModel.self, from: safeData)
            
            for indexMovie in 1...19{
                
                var movie = MovieModel()
                
                movie.originalTitle = value.results[indexMovie].original_title
                movie.id = value.results[indexMovie].id
                movie.colorHex = RandomFlatColor().hexValue()
                topMovieArray.append(movie)

                
            }
            
        }catch let e{
            let alert = alerts.showAlert(message: e.localizedDescription)
            self.delegate?.presentError(alert: alert)
        }
        
    }
    
    //MARK: - Search Bar Methods
    func searchTitle(searchBar: String?){
        
        var values : [MovieModel] = []
        if let words = searchBar{
            let result = topMovieArray.filter { $0.originalTitle.contains(words) }
            
            for movie in result{
                values.append(movie)
            }
            topMovieArray = values
        }
    }
    
    //MARK: - Manipulation Methods Realm
    func deleteTopMovie(){
        
        do{
            try localRealm.write({
                localRealm.deleteAll()
            })
        }catch{
            
            return
        }
    }
    
    func saveItemTapped(movieTapped: ItemSelected){
        
        do{
            try localRealm.write({
                localRealm.add(movieTapped)
            })
        }catch{
            return
        }
    }
    
    func createObject(with value: MovieModel?){
        
        let movie = ItemSelected()
        if let tappedMovie = value{
            movie.id = tappedMovie.id
            movie.colorHex = tappedMovie.colorHex
            saveItemTapped(movieTapped: movie)
        }
    }
    
    func reviewData(value: Int){
        if value == 0{
            let alert = alerts.showAlert(message: "We cannot get data, try to connect a network")
            self.delegate?.presentError(alert: alert)
        }
    }
    
    
}
