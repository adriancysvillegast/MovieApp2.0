//
//  RegisterViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCorner()
    }
    
//MARK: - buttonCorner
    func buttonCorner() {
        continueButtonOutlet.layer.cornerRadius = 10
    }
    
    
    //MARK: - RegisterButtonPressed
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.Segues.registerToTopMovies, sender: self)
    }

}
//MARK: - RegisterViewModelDelegate

extension RegisterViewController: RegisterViewModelDelegate{
    func nextView() {
        performSegue(withIdentifier: Constants.Segues.registerToTopMovies, sender: self)
    }
    
    func presentError(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    
}

