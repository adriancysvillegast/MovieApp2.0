//
//  LogInService.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 22/7/22.
//

import Foundation

protocol LogInFeching {
    func logIn(onComplete: @escaping (GuestSession) -> (), onError: @escaping (String) -> () )
}
class LogInService: LogInFeching {


    //MARK: - properties
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    private let endpointGuestSession = ProcessInfo.processInfo.environment["endpointGuestSession"]!
    private let apiKey = ProcessInfo.processInfo.environment["apiKey"]!
    private let endpointValidateLogIn = ProcessInfo.processInfo.environment["endpointValidateLogIn"]!
    
    //MARK: - Service
    func logIn(onComplete: @escaping (GuestSession) -> (), onError: @escaping (String) -> ()) {
        CallAPI.shared.get(url: "\(baseURL)\(endpointGuestSession)api_key=\(apiKey)") { response in
            switch response {
            case .success(let data):
                guard let safeData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let guestSession = try decoder.decode(GuestSession.self, from: safeData)
                    onComplete(guestSession)
                }catch{
                    onError(error.localizedDescription)
                }
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
    }
    
    
}
