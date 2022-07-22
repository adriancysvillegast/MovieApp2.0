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
    
    struct ErrorMessages {
        static let title = "Error"
        static let didError = "Ups!, we couldn't get data."
        static let didErrorImage = "We have problems to load the image"
    }
    
    struct API{
        
        struct APIKey {
            static let keyValue = "72597abf4f8c2d4f845321712c1293d5"
        }
        
        struct Urls{
            static let endpointCategories = "/genre/movie/list?&language=en-US&api_key=\(Constants.API.APIKey.keyValue)"

            struct InProcess {
                static let urlToken = "https://api.themoviedb.org/3/authentication/token/new?api_key="
                static let urlSessionId = "https://api.themoviedb.org/3/authentication/session/new?api_key="
            }
        }
    }

}
