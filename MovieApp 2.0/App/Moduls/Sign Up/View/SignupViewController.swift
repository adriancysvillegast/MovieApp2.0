//
//  SignupViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 19/6/22.
//

import UIKit

class SignupViewController: UIViewController{
    
    //MARK: - Properties

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
        text.placeholder = "Add your password"
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
        
        [usernameTextField, emailTextField, passwordTextField, passwordConfTextField, buttonRegister, alreadyHaveAccount].forEach {
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
            
            buttonRegister.topAnchor.constraint(equalTo: passwordConfTextField.bottomAnchor, constant: 30),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50),
            buttonRegister.widthAnchor.constraint(equalToConstant: 180),
            buttonRegister.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            alreadyHaveAccount.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 10),
            alreadyHaveAccount.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)

        ])
    }
    //MARK: - Target
    private func addTarged(){
        
    }
    
    
    
}
