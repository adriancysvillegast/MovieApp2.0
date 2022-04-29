//
//  LoginViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    //MARK: - Vars
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        buttonCorner()
    }
    
    
    func configuration(){
        activityIndicator.stopAnimating()
    }
    
    //MARK: - buttonCorner
    func buttonCorner(){
        continueButtonOutlet.layer.cornerRadius = 10
    }
    

    //MARK: - loginButtonPressed
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.Segues.loginToTopMovies, sender: self)
    }
    
    //MARK: - RegisterButtonPressed
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.Segues.goToRegister, sender: self)
    }
    
}
//MARK: - LoginViewModelDelegate
extension LoginViewController: LoginViewModelDelegate{
    func nextView() {
        performSegue(withIdentifier: Constants.Segues.loginToTopMovies, sender: self)
    }
    
    func presentError(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    
}
