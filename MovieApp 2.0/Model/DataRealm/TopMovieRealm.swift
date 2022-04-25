//
//  TopMovieRealm.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation
import RealmSwift

class TopMovieRealm : Object {
    
    @Persisted var id : Int = 0
    @Persisted var original_title : String = ""
    @Persisted var color_Hex : String = ""
}
