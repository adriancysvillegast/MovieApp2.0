//
//  ItemSelected.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 25/4/22.
//

import Foundation
import RealmSwift

class ItemSelected : Object{
    
    @Persisted var id : Int = 0
    @Persisted var colorHex : String = ""
}
