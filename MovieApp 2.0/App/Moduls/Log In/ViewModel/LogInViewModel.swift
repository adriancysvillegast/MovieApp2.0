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
}

class LogInViewModel{
    
    private var emailValidation : Bool = false
    private var passwordValidation : Bool = false
    weak var delegate : LogInDelegate?
    
    func buttonActivate(){
        if emailValidation && passwordValidation{
            self.delegate?.activateButton()
        }
    }
    
    func loginFirebase(email: String, password: String){
//        firebase code
    }
    
    func validateEmail(value: String?){
        if let emailValue = value{
            let regularExpresion = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpresion)
            if !predicate.evaluate(with: emailValue){
                validateEmailCount(value: emailValue)
                emailValidation = false
            } else{
                emailValidation = true
            }
        }
        buttonActivate()
    }

    func validateEmailCount(value: String){
        if value.count > 30{
            let message = "Please type an email address. example@gmail.com"
            self.delegate?.showError(message: message)
        }
    }
    
    func validatePassword(value: String?){
        if let passwordValue = value{
            if passwordValue.count < 6{
                passwordValidation = false
            }else{
                if contentDigit(value: passwordValue) &&
                    contentLowerCase(value: passwordValue) &&
                    contentUpperCase(value: passwordValue) {
                    passwordValidation = true
                }else{
                    passwordValidation = false
                }
            }
        }
        buttonActivate()
    }
    
    func contentDigit(value: String) -> Bool{
        let regularExpresion = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpresion)
        return predicate.evaluate(with: value)
    }

    func contentLowerCase(value: String) -> Bool{
        let regularExpresion = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpresion)
        return predicate.evaluate(with: value)
    }

    func contentUpperCase(value: String) -> Bool{
        let regularExpresion = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpresion)
        return predicate.evaluate(with: value)
    }
}
