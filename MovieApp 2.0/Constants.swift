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
            
            static let urlTopMovies = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.API.APIKey.keyValue)&language=en-US&page="
            
            
            struct InProcess {
                static let urlToken = "https://api.themoviedb.org/3/authentication/token/new?api_key="
                
                static let urlSessionId = "https://api.themoviedb.org/3/authentication/session/new?api_key="
                
            }
        }
    }

    struct Xibs{
        static let nibName = "TopMovieTableViewCell"
        static let identifierCell = "cell"
        
        static let viewDetail = "DetailXIBViewController"
        
    }
    struct Segues{
        
        static let goToLogin = "goToLogin"
        static let goToRegister = "goToRegister"
        static let registerToTopMovies = "registerToTopMovies"
        static let loginToTopMovies = "loginToTopMovies"
        static let goToDetails = "goToDetailMovie"
        static let topMovieToLogin = "logOut"
        
        
    }
    
    struct Colors{
        static let colorCell : [String] = ["#fad390","#f8c291","#6a89cc","#82ccdd","#b8e994","#f6b93b","#e55039","#4a69bd","#60a3bc","#78e08f","#fa983a","#eb2f06","#1e3799","#3c6382","#38ada9","#e58e26","#b71540","#0c2461","#0a3d62","#079992"]
    }
}
