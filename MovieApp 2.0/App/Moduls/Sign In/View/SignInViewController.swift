//
//  SignInViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 30/5/22.
//

import UIKit

protocol SignInDelegate{
    func showError(message: String)
    func activateButton()
}

class SignInViewController: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private var viewModel : SignInViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SignInViewModel(delegate: self)
        setupView()
    }

    func setupView(){
        continueButtonOutlet.layer.cornerRadius = 15
        continueButtonOutlet.isEnabled = true
        continueButtonOutlet.backgroundColor = .gray
    }
    
    @IBAction func emailText(_ sender: UITextField) {
        viewModel?.validateEmail(value: email.text)
    }
    
    @IBAction func passwordText(_ sender: UITextField) {
        viewModel?.validatePasswordA(value: password.text)
    }
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
    }
}
//MARK: - TextField delegate
extension SignInViewController: UITextFieldDelegate{
    
    
    
}
//MARK: - SignUpButton
extension SignInViewController{
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
    }
}
//MARK: - SignInDelegate
extension SignInViewController: SignInDelegate{
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func activateButton() {
        continueButtonOutlet.isHidden = false
        continueButtonOutlet.backgroundColor = .green
    }
}
