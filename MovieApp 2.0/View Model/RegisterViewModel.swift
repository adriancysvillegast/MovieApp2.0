//
//  RegisterViewModel.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import Foundation
import Firebase

protocol RegisterViewModelDelegate{
    func nextView()
    func presentError(alert: UIAlertController)
}
struct RegisterViewModel {
    
    let alerts = ShowAlertsViewController()
    var delegate : RegisterViewModelDelegate?
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { dataResult, error in
            if let e = error{
                let alert = self.alerts.showAlert(message: e.localizedDescription)
                self.delegate?.presentError(alert: alert)
            }else{
                //                   segue
                self.delegate?.nextView()
            }
        }
    }
    
    func validationSession(email: String?, password: String?){
        if email == "" && password == "" {
            let alert = alerts.showAlert(message: "Provide an Email and Password")
            self.delegate?.presentError(alert: alert)
        }else if email == "" {
            let alert = alerts.showAlert(message: "Provide Email address")
            self.delegate?.presentError(alert: alert)
        }else if password == "" {
            let alert = alerts.showAlert(message: "Provide Password with more that 6 charters")
            self.delegate?.presentError(alert: alert)
        }else {
            login(email: email!, password: password!)
        }
        
    }

    
    
}
