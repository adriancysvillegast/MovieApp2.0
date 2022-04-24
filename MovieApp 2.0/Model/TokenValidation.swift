//
//  TokenValidation.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation


struct TokenValidation : Codable{
    
    let success : Bool
    let expires_at : String
    let request_token : String
}
