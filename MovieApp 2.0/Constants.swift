//
//  Constants.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import Foundation

struct Constants{
    
    struct Title{
        static let titleName = "Movies App"
    }
    
    struct API{
        
        struct APIKey {
            static let keyValue = "72597abf4f8c2d4f845321712c1293d5"
        }
        
        struct Urls{
            
            static let urlToken = "https://api.themoviedb.org/3/authentication/token/new?api_key="
        }
    }
    
    struct Segues{
        
        static let goToLogin = "goToLogin"
        static let goToRegister = "goToRegister"
        static let registerToTopMovies = "registerToTopMovies"
        static let loginToTopMovies = "loginToTopMovies"
        static let goToDetails = "goToDetails"
        
        
    }
}
