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
        static let didErrorLogin = "We couldn't log in, try again"
        static let didErrorGenre = "We couldn't load data"
    }
    
    struct API{

        struct Urls{
            static let endpointCategories = "/genre/movie/list?&language=en-US&api_key="
        }
    }

    struct UserDefaultKey {
        static let key = "token"
    }
}
