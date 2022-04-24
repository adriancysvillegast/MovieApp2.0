//
//  TopMovieViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/4/22.
//

import Foundation

struct TopMovieViewModel{
    
    let getDataAPI = GetDataAPI()
    
    
    func printData(){
        getDataAPI.fetchData()
    }
    
 
}
