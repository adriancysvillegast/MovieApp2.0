//
//  GetDataAPI.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation
import Alamofire

class GetDataAPI {
  
    
//to get de tokenValidation
    func getTokenValidation(){
        
        let urlRequest = "\(Constants.API.Urls.urlToken)\(Constants.API.APIKey.keyValue)"
        
        AF.request(urlRequest, requestModifier: {
            $0.timeoutInterval = 120
        }).responseDecodable(of: TokenValidation.self) { response in
            
            guard let safeData = response.data else{
                fatalError("Error saving tokenValidation")
            }
            
            do{
                
                let decoder = JSONDecoder()
                let value = try decoder.decode(TokenValidation.self, from: safeData)
                self.createSession(with: value.request_token)
            }catch let e{
//                aqui se muestra alerta para decir que no se pudo generar tokenValidation
                print("\(e.localizedDescription) fallo el DO")
            }
            
            
        }
    }
    
    func createSession(with tokenValitadion: String){
        print(tokenValitadion)
        
//        aqui debo crear la funcion para el request de la session
    }
    
    
}
