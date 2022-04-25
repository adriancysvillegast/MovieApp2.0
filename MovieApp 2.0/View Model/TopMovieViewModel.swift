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

class TopMovieViewModel{
    
    let localRealm = try! Realm()
    var topMovies : Results<TopMovieRealm>?
    
    //MARK: - fetchDataTopMovie
    func fetchDataTopMovie() {
        
        
        DispatchQueue.main.async {
            self.deleteTopMovie()
        }
        
            for index in 1...1{ //5
                
                let urlRequest = "\(Constants.API.Urls.urlTopMovies)\(index)"
                
                AF.request(urlRequest, requestModifier: {
                    $0.timeoutInterval = 120
                }).responseDecodable(of: TopMovieModel.self) { response in
                        
                        guard let safeData = response.data else{
                            fatalError("Error saving tokenValidation")
                        }
                    DispatchQueue.main.async {
                        
                        self.parseJSON(safeData: safeData)
                    }
                    
                }
            }
    }
    
    
    func parseJSON(safeData: Data){
        
        do{
            let decoder = JSONDecoder()
            let value = try decoder.decode(TopMovieModel.self, from: safeData)
            
            for indexMovie in 1...19{
               
                
                let movie = TopMovieRealm()
                movie.original_title = value.results[indexMovie].original_title
                movie.id = value.results[indexMovie].id
                
                movie.color_Hex = RandomFlatColor().hexValue()
                self.saveTopMovie(movieTop: movie)
                
            }
            
        }catch let e{
            //                aqui se muestra alerta para decir que no se pudo generar tokenValidation
            print("\(e.localizedDescription) fallo el getTopMovie")
        }
        
    }
    
    
    
    //MARK: - Manipulation Methods Realm
    
    func saveTopMovie(movieTop : TopMovieRealm){
        
        do{
            try localRealm.write({
                localRealm.add(movieTop)
            })
        }catch let e{
            print(e.localizedDescription)
        }
    }
 
    func deleteTopMovie(){
        do{
            try localRealm.write({
                localRealm.deleteAll()
            })
        }catch let e{
            print(e.localizedDescription)
        }
    }
}
