//
//  GetDataAPI.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation
import Alamofire

class GetDataAPI {
  
    //MARK: - GetTopMovies
    func fetchData(){
        
        for index in 1...1{ //5
           
            let urlRequest = "\(Constants.API.Urls.urlTopMovies)\(index)"
            
            
                AF.request(urlRequest, requestModifier: {
                    $0.timeoutInterval = 120
                }).responseDecodable(of: TopMovie.self) { response in
                    
                    guard let safeData = response.data else{
                        fatalError("Error saving tokenValidation")
                    }
                    
                    do{
                        let decoder = JSONDecoder()
                        let value = try decoder.decode(TopMovie.self, from: safeData)
                        
                        for indexMovie in 1...19{
                            print(value.results[indexMovie].original_title)
                            
                        }
                    }catch let e{
        //                aqui se muestra alerta para decir que no se pudo generar tokenValidation
                        print("\(e.localizedDescription) fallo el getTopMovie")
                    }
                }
            
            
        }
        
        
    }
    //MARK: - GetDetailMovies

    
    
    
}
