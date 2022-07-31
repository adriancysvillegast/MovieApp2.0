//
//  LogInViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 1/7/22.
//

import UIKit
import TransitionButton

class LogInViewController: UIViewController{
    
    //MARK: - Properties

    private lazy var viewModel: LogInViewModel = {
        let viewModel = LogInViewModel()
        viewModel.delegate = self
        return viewModel
    }()

    private lazy var emailTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .newPassword
        text.placeholder = "Email"
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var passwordTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.isSecureTextEntry = true
        text.textContentType = .newPassword
        text.placeholder = "Password"
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var buttonLogIn: TransitionButton = {
        let button = TransitionButton()
        button.backgroundColor = UIColor.systemGreen
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.isEnabled = false
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var buttonCreateAccount: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 280, height: 30))
        button.setTitle("You do not have an account? Sign Up", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        setupView()
        setupConstraint()
        addTarget()
    }
    
    //MARK: - setupView
    
    
    private func setupView(){
        view.backgroundColor = .white
        [emailTextField, passwordTextField, buttonLogIn, buttonCreateAccount].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.widthAnchor.constraint(equalToConstant: 320),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.widthAnchor.constraint(equalToConstant: 320),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonLogIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.widthAnchor.constraint(equalToConstant: 160),
            buttonLogIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonCreateAccount.topAnchor.constraint(equalTo: buttonLogIn.bottomAnchor, constant: 10),
            buttonCreateAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
    
    //MARK: - Target
    
    func addTarget(){
        buttonLogIn.addTarget(self, action: #selector(logInButton), for: .touchUpInside)
        
        emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingDidEnd)
        
        passwordTextField.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        
        buttonCreateAccount.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
    }
    
    @objc func logInButton(){
        viewModel.logIn(email: emailTextField.text!, password: passwordTextField.text!)
    }
     
    @objc func validateEmail(){
        viewModel.validateEmail(with: emailTextField.text)
    }
    
    @objc func validatePassword(){
        viewModel.validatePassword(with: passwordTextField.text)
    }
    
    @objc func goToSignUp(){
        let signupViewController = SignupViewController()
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
//MARK: - all Delegate
extension LogInViewController: LogInDelegate, UITextFieldDelegate{
//    UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    LogInDelegate
    func startSpinner() {
        buttonLogIn.startAnimation()
    }
    
    func stopSpinner() {
        buttonLogIn.stopAnimation()
    }
    
    func navigateVC() {
        let vc = TopMovieViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.ValidationMessages.titleModal, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func activateButton() {
        buttonLogIn.isEnabled = true
        buttonLogIn.backgroundColor = .systemGreen
    }
    
    func desactivateButton() {
        buttonLogIn.isEnabled = false
        buttonLogIn.backgroundColor = .systemGray
    }
}
