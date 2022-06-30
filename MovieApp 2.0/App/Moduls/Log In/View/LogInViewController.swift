//
//  LogInViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 30/5/22.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    lazy var viewModel : LogInViewModel = {
       let viewModel = LogInViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        title = "Sign In"
        super.viewDidLoad()
        setupView()
    }

    func setupView(){
        continueButtonOutlet.layer.cornerRadius = 15
        continueButtonOutlet.isEnabled = true
        continueButtonOutlet.backgroundColor = .gray
        email.layer.borderColor = UIColor.black.cgColor
        password.layer.borderColor = UIColor.black.cgColor
        email.layer.borderWidth = 0.5
        password.layer.borderWidth = 0.5
    }
    
    @IBAction func emailText(_ sender: UITextField) {
        viewModel.validateEmail(value: email.text)
    }
    
    @IBAction func passwordText(_ sender: UITextField) {
        viewModel.validatePassword(value: password.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: - ContinueButtonTapped
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
    }
    //MARK: - SignUpButtonTapped
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let signUpViewController = SignupViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
//MARK: - LogInDelegate
extension LogInViewController: LogInDelegate{
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
