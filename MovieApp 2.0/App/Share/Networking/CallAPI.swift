//
//  CallAPI.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 30/5/22.
//

import Foundation
import Alamofire

class CallAPI{
    
    //MARK: - Properties
    static let shared = CallAPI()
    
    //MARK: - Post
    func post(url: String, params: [String:Any], completion: @escaping (Result<Data?, AFError>) -> () ) {
        AF.request(url, method: .post, parameters: params).response{ response in
            completion(response.result)
        }
    }
    
    //MARK: - Get
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> () ) {
        AF.request(url).response{
            response in
            completion(response.result)
        }
    }
    
}
