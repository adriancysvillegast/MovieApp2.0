//
//  MovieDetails.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 20/7/22.
//

import Foundation

struct MovieDetails: Codable {
    let adult : Bool
    let genres : [Genre]
    let id : Int
    let originalLanguage : String
    let originalTitle : String
    let overview : String?
    let popularity : Float
    let posterPath : String?
    let releaseDate : String
    let voteAverage : Float
    let voteCount : Int
}
