//
//  Movie.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 30/5/22.
//

import Foundation

struct Movie : Codable{
    let posterPath: String?
    let adult: Bool
    let overview: String
    let id : Int
    let originalTitle : String
}

