//
//  ValidationsData.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 29/6/22.
//

import Foundation

protocol ValidateDataDelegate: AnyObject{
    func errorValidation(message: String)
}

/** This class is for make all validations of log in or sign up **/
class ValidationsData{
//MARK: - Properties
    weak var delegate: ValidateDataDelegate?
    
    var validateName : Bool = false
    
//MARK: - Validation UserName
    
    func validateName(with name: String) -> Bool{
        if name.count < 3{
            self.delegate?.errorValidation(message: Constants.ValidationMessages.nameShort)
            validateName = false
        }
            
        if validateCharacterName(name: name){
            validateName = true
        }
        return validateName
    }
    
    func validateCharacterName(name: String) -> Bool{
        let decimalCharters = CharacterSet.decimalDigits
        let decimalRange = name.rangeOfCharacter(from: decimalCharters)
        
        if decimalRange != nil{
            validateName = false
        }else{
            validateName = true
        }
        return validateName
    }
    
    //MARK: - Validation email
    
    func validationEmail(with email: String){
        let regularExpresion = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpresion)
        if !predicate.evaluate(with: email){
            //error
        }
    }
}
