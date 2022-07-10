//
//  SignupViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/6/22.
//

import UIKit
import TransitionButton

class SignupViewController: UIViewController{
    
    //MARK: - Properties

    private lazy var viewModel: SignupViewModel = {
        let viewModel = SignupViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
//    TextFields
    private lazy var usernameTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .username
        text.placeholder = "Add your name"
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private lazy var emailTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .emailAddress
        text.placeholder = "Add your email"
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
        text.placeholder = "Add your password"
        text.delegate = self
        text.isSecureTextEntry = true
        text.textContentType = .newPassword
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var passwordConfTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.isSecureTextEntry = true
        text.textContentType = .newPassword
        text.placeholder = "Add your password again"
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
//    Bottons
    private var buttonRegister: TransitionButton = {
        let button = TransitionButton(frame: CGRect(x: 0, y: 0, width: 180, height: 50))
        button.backgroundColor = UIColor.systemGreen
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.isEnabled = false
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var alreadyHaveAccount: UIButton = {
        let button = UIButton()
        button.setTitle("Do you already have account? Sign In", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //Label to error password
    private let errorPasswordLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "This password is not the same!"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.text = "Sign Up"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        addTargets()    }
    
    //MARK: - SetupView
    private func setupView(){
        view.backgroundColor = .white
//        view.addSubview(scrollView)
//        scrollView.addSubview(containerView)

        [ usernameTextField, emailTextField, passwordTextField, passwordConfTextField,errorPasswordLabel, buttonRegister, alreadyHaveAccount
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
 
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -5),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordConfTextField.topAnchor, constant: -5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            passwordConfTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordConfTextField.bottomAnchor.constraint(equalTo: buttonRegister.topAnchor, constant: -25),
            passwordConfTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordConfTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            errorPasswordLabel.topAnchor.constraint(equalTo: passwordConfTextField.bottomAnchor, constant: 5),
            errorPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            buttonRegister.bottomAnchor.constraint(equalTo: alreadyHaveAccount.topAnchor, constant: 8),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50),
            buttonRegister.widthAnchor.constraint(equalToConstant: 180),
            buttonRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            alreadyHaveAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alreadyHaveAccount.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    //MARK: - Target
    private func addTargets(){
        usernameTextField.addTarget(self, action: #selector(self.validateName), for: UIControl.Event.editingDidEnd)
        
        emailTextField.addTarget(self, action: #selector(self.validateEmail), for: UIControl.Event.editingDidEnd)
        
        passwordTextField.addTarget(self, action: #selector(self.validatePassword), for: UIControl.Event.editingDidEnd)
        
        passwordConfTextField.addTarget(self, action: #selector(self.confirmationPassword), for: UIControl.Event.editingChanged)
        
        buttonRegister.addTarget(self, action: #selector(self.registerUser), for: .touchUpInside)
    }
    
    @objc func validateName(){
        viewModel.validateName(name: usernameTextField.text)
    }
    
    @objc func validateEmail(){
        viewModel.validateEmail(email: emailTextField.text)
    }
    
    @objc func validatePassword(){
        viewModel.validatePassword(password: passwordTextField.text)
    }
    
    @objc func confirmationPassword(){
        viewModel.confirmationPassword(passwordA: passwordTextField.text, passwordB: passwordConfTextField.text)
    }
    
    @objc func registerUser(){
        self.viewModel.register(email: self.emailTextField.text!, password: self.passwordTextField.text!)
    }
    

}

//MARK: - All Delegate
extension SignupViewController: SignupViewModelDelegate, UITextFieldDelegate{
    
    //    UITextFieldDelegate
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            return true
//        }
//        
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//
//            if textField == passwordTextField || textField == passwordConfTextField {
//                scrollView.frame.origin.y -= 160
//            }
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            if textField == usernameTextField || textField == emailTextField || textField == passwordTextField || textField == passwordConfTextField {
//                scrollView.frame.origin.y = 0
//            }
//
////            debo hacer otro if ya que no me cubre por completo
//        }
    
    
    //    SignupViewModelDelegate
    func startAnimationButton() {
        buttonRegister.startAnimation()
    }
    
    func stopAnimationButton() {
        buttonRegister.stopAnimation()
    }
    
    func showLabel() {
        errorPasswordLabel.isHidden = false
    }
    
    func hideLabel() {
        errorPasswordLabel.isHidden = true
    }
    
    func activateButton() {
        buttonRegister.isEnabled = true
        buttonRegister.backgroundColor = UIColor.systemGreen
    }
    
    func hideButton() {
        buttonRegister.isEnabled = false
        buttonRegister.backgroundColor = UIColor.systemGray
    }

    func showInfo(message: String) {
        let alert = UIAlertController(title: Constants.ValidationMessages.titleModal, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

    
    
}
