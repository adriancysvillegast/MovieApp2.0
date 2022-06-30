//
//  SignupViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/6/22.
//

import UIKit

class SignupViewController: UIViewController{
    
    //MARK: - Properties

    private lazy var viewModel: SignupViewModel = {
        let viewModel = SignupViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height)
    
//    Views
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = contentViewSize
        scroll.frame = self.view.bounds
        scroll.autoresizingMask = .flexibleHeight
        scroll.autoresizingMask = .flexibleWidth
        scroll.backgroundColor = .white
        scroll.showsHorizontalScrollIndicator = true
        return scroll
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        view.backgroundColor = .white
        return view
    }()
//    TextFields
    private var usernameTextField:  UITextField = {
        let text = UITextField()
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .username
        text.placeholder = "Add your name"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private var emailTextField:  UITextField = {
        let text = UITextField()
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .emailAddress
        text.placeholder = "Add your email"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var passwordTextField:  UITextField = {
        let text = UITextField()
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.placeholder = "Add your password"
        text.isSecureTextEntry = true
        text.textContentType = .newPassword
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var passwordConfTextField:  UITextField = {
        let text = UITextField()
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.isSecureTextEntry = true
        text.textContentType = .newPassword
        text.placeholder = "Add your password again"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
//    Bottons
    private var buttonRegister: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemGreen
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var alreadyHaveAccount: UIButton = {
        let button = UIButton()
        button.setTitle("Do you already have account? Sign In", for: .normal)
        button.layer.cornerRadius = 10
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

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    //MARK: - SetupView
    private func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        [usernameTextField, emailTextField, passwordTextField, passwordConfTextField,errorPasswordLabel, buttonRegister, alreadyHaveAccount].forEach {
            containerView.addSubview($0)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 230),
            usernameTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            usernameTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            passwordConfTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordConfTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordConfTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordConfTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -25),

            errorPasswordLabel.topAnchor.constraint(equalTo: passwordConfTextField.bottomAnchor, constant: 5),
            errorPasswordLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: passwordConfTextField.bottomAnchor, constant: 40),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50),
            buttonRegister.widthAnchor.constraint(equalToConstant: 180),
            buttonRegister.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            alreadyHaveAccount.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 10),
            alreadyHaveAccount.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)

        ])
    }
    //MARK: - Target
    private func addTarged(){
        usernameTextField.addTarget(self, action: #selector(validateName), for: UIControl.Event.editingDidEnd)
        
        emailTextField.addTarget(self, action: #selector(validateEmail), for: UIControl.Event.editingDidEnd)
        
        passwordTextField.addTarget(self, action: #selector(validatePassword), for: UIControl.Event.editingDidEnd)
        
        usernameTextField.addTarget(self, action: #selector(confirmationPassword), for: UIControl.Event.editingChanged)
        
        buttonRegister.addTarget(self, action: #selector(registerUser), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc private func validateName(){
        viewModel.validateName(name: usernameTextField.text)
    }
    
    @objc private func validateEmail(){
        viewModel.validateEmail(email: emailTextField.text)
    }
    
    @objc private func validatePassword(){
        viewModel.validatePassword(password: passwordTextField.text)
    }
    
    @objc private func confirmationPassword(){
        viewModel.confirmationPassword(passwordA: passwordTextField.text, passwordB: passwordConfTextField.text)
    }
    
    @objc private func registerUser(){
//        create spinner on button here
        DispatchQueue.main.async {
            self.viewModel.register(email: self.emailTextField.text!, password: self.passwordTextField.text!)
        }
    }
    
    //MARK: - Button Spinner
    private func buttonSpinner(){
        
    }
}

//MARK: - ValidateDataDelegate, SignupViewModelDelegate
extension SignupViewController: ValidateDataDelegate, SignupViewModelDelegate{
    //    SignupViewModelDelegate
    func showLabel() {
        errorPasswordLabel.isHidden = false
    }
    
    func hideLabel() {
        errorPasswordLabel.isEnabled = true
    }
    
    func activateButton() {
        buttonRegister.isHidden = false
        buttonRegister.backgroundColor = UIColor.systemGreen
    }
    
    func hideButton() {
        buttonRegister.isHidden = true
        buttonRegister.backgroundColor = UIColor.systemGray
    }
//    ValidateDataDelegate
    func errorValidation(message: String) {
        let alert = UIAlertController(title: Constants.ValidationMessages.titleModal, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    

    
    
}
