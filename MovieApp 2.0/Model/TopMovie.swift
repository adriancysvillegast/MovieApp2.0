//
//  TopMovie.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation


struct TopMovie : Codable{
    
    let results : [ResultsMovie]
    
    
    struct ResultsMovie : Codable{
        let id : Int
        let original_title : String
        
    }
}
