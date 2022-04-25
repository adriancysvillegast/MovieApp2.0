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
    
    //MARK: - Vars
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.stopAnimating()
        buttonCorner()
    }
    
    
    func configuration(){
        
    }
    
    //MARK: - buttonCorner
    func buttonCorner(){
        continueButtonOutlet.layer.cornerRadius = 10
    }
    

    //MARK: - loginButtonPressed
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        activityIndicator.stopAnimating()
        
        performSegue(withIdentifier: Constants.Segues.loginToTopMovies, sender: self)
    }
    
    //MARK: - RegisterButtonPressed
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: Constants.Segues.goToRegister, sender: self)
    }
    
}
