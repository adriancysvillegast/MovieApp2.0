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
    
    struct ValidationMessages{
        static let titleModal = " Error!"
        static let nameShort = "Please add a name with more than three character"
        static let nameWithNumbers = " Please don't used number on your name"
        static let emailError = "Please add an email addres, just like this example@gmail.com"
        static let passwordError = "Ey! type a password with more than six charater and uses numbers, lowercase and uppercase letters"
        
    }
    
    
    struct API{
        
        struct APIKey {
            static let keyValue = "72597abf4f8c2d4f845321712c1293d5"
        }
        
        struct Urls{
            
            static let urlTopMovies = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.API.APIKey.keyValue)&language=en-US&page="
            static let getImage = "https://image.tmdb.org/t/p/w500"
            static let urlSearcMoviePart1 = "https://api.themoviedb.org/3/movie/"
            static let urlSearcMoviePart2 = "?api_key=\(Constants.API.APIKey.keyValue)&language=en-US"
            
            struct InProcess {
                
                static let urlToken = "https://api.themoviedb.org/3/authentication/token/new?api_key="
                static let urlSessionId = "https://api.themoviedb.org/3/authentication/session/new?api_key="
            }
        }
    }

}
