//
//  LogInViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 30/5/22.
//

import Foundation
protocol LogInDelegate: AnyObject{
    func showError(message: String)
    func activateButton()
    func desactivateButton()
    func startSpinner()
    func stopSpinner()
}

class LogInViewModel{
    //MARK: - Properties
    
    let validationData = ValidationsData()
    weak var delegate: LogInDelegate?
   
    private var emailValidation: Bool = false
    private var passwordValidation: Bool = false
    private let service: LogInFeching?
    
    init(service: LogInFeching = LogInService()) {
        self.service = service
    }
    
    //MARK: - LogIn
    
    func logIn(email: String, password: String){
        
        service?.logIn(onComplete: { token in
            let userDefault = UserDefaults.standard
            userDefault.set(token.guestSessionId, forKey: Constants.UserDefaultKey.key)
        }, onError: { error in
            self.delegate?.showError(message: Constants.ErrorMessages.didErrorLogin)
        })
    }
    
    //MARK: - Button Activate
    
    func buttonActivate(){
        if emailValidation && passwordValidation{
            self.delegate?.activateButton()
        }else {
            self.delegate?.desactivateButton()
        }
    }
    
    
    //MARK: - Validations
    
    func validateEmail(with email: String?){
        guard let email = email else {
            return
        }
        
        if !validationData.validationEmail(with: email){
            emailValidation = false
            self.delegate?.showError(message: Constants.ValidationMessages.emailError)
        }else{
            emailValidation = true
        }
        buttonActivate()
    }
    
    func validatePassword(with password: String?){
        guard let password = password else {
            return
        }
        
        if validationData.validatePassword(with: password){
            if validationData.validatePasswordCount(with: password){
                passwordValidation = true
            }else{
                passwordValidation = false
            }
        }else{
            passwordValidation = false
        }
        buttonActivate()
    }
    
    //MARK: - Save Token
    
    
}

