//
//  SignupViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 29/6/22.
//

import Foundation

protocol SignupViewModelDelegate: AnyObject{
    func activateButton()
    func hideButton()
    func showLabel()
    func hideLabel()
    func startAnimationButton()
    func stopAnimationButton()
    func showInfo(message: String)
    
}

class SignupViewModel{
    //MARK: - Properties
    let validateData = ValidationsData()
    
    private var usernameValidation: Bool = false
    private var emailValidation: Bool = false
    private var passwordValidation: Bool = false
    private var samePasswordValidation: Bool = false
    weak var delegate: SignupViewModelDelegate?
    //MARK: - Register
    func register(email: String, password: String){
        self.delegate?.startAnimationButton()
//        registrar en api y en alamofire
    }
    
    //MARK: - LookData
    
    private func lookData(){
        if usernameValidation && emailValidation && passwordValidation && samePasswordValidation {
            self.delegate?.activateButton()
        }else{
            self.delegate?.hideButton()
        }
    }

    //MARK: - Validate
    func validateName(name: String?){
        guard let name = name else {
            return
        }
        
        if !validateData.validateNameCount(with: name){
            usernameValidation = false
            self.delegate?.showInfo(message: Constants.ValidationMessages.nameShort)
        }else{
            if !validateData.validateCharacterName(name: name){
                usernameValidation = false
                self.delegate?.showInfo(message: Constants.ValidationMessages.nameWithNumbers)
            }else{
                usernameValidation = true
            }
        }
        lookData()
    }
    
    func validateEmail(email: String?){
        guard let email = email else {
            return
        }
        
        if !validateData.validationEmail(with: email){
            emailValidation = false
            self.delegate?.showInfo(message: Constants.ValidationMessages.emailError)
        }else{
            emailValidation = true
        }
        lookData()
    }
    
    func validatePassword(password: String?){
        guard let password = password else {
            return
        }

        if !validateData.validatePasswordCount(with: password){
            passwordValidation = false
            self.delegate?.showInfo(message: Constants.ValidationMessages.passwordError)
        }else{
            if !validateData.validatePassword(with: password){
                passwordValidation = false
                self.delegate?.showInfo(message: Constants.ValidationMessages.passwordError)
            }else{
                passwordValidation = true
            }
        }
        lookData()
    }
    
    func confirmationPassword(passwordA: String?, passwordB: String?){
        guard let passwordA = passwordA, let passwordB = passwordB else {
            return
        }
        
        if !validateData.confirmatePasswords(passwordA: passwordA, passwordB: passwordB){
            samePasswordValidation = false
            self.delegate?.showLabel()
        }else{
            samePasswordValidation = true
            self.delegate?.hideLabel()
        }
        lookData()
    }

}
