//
//  SignupViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 29/6/22.
//

import Foundation

class SignupViewModel{
    //MARK: - Properties
    let validateData = ValidationsData()
    
    var usernameValidation: Bool = false
    
    
    //MARK: - Register
    func register(email: String, password: String){
        
    }

    //MARK: - Validate
    func validateName(name: String?){
        guard let name = name else {
            return
        }
        
        if validateData.validateName(with: name){
            usernameValidation = true
        }
    }
    
    func validateEmail(email: String?){
        guard let email = email else {
            return
        }
        validateData.validationEmail(with: email)
    }
    
    
    
    
}
