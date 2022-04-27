//
//  DetailMovieModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation

struct DetailMovieModel: Codable{
    
    let adult : Bool
    let budget : Int
    let genres : [Genre]
    let id : Int
    let original_language : String
    let original_title : String
    let overview : String?
    let popularity : Float
    let production_companies : [ProductionCompanies]
    let production_countries : [ProductionCountries]
    let release_date : String
    let runtime : Int?
    let spoken_languages : [SpokenLanguages]
    let status : String
    let vote_average : Float
    let vote_count : Int
}
struct Genre: Codable {
    let name : String
}
struct ProductionCompanies: Codable {
    let name : String
    
}
struct ProductionCountries: Codable {
    let name : String
}
struct SpokenLanguages : Codable {
    let name : String
}

