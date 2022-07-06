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
        scroll.showsVerticalScrollIndicator = true
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
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .username
        text.placeholder = "Add your name"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private var emailTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textContentType = .emailAddress
        text.placeholder = "Add your email"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var passwordTextField:  UITextField = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
        let text = UITextField()
        text.leftView = spacer
        text.leftViewMode = .always
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
//        title = "Sign Up"
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        addTarged()    }
    
    //MARK: - SetupView
    private func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        [titleLabel, usernameTextField, emailTextField, passwordTextField, passwordConfTextField,errorPasswordLabel, buttonRegister, alreadyHaveAccount
        ].forEach {
            containerView.addSubview($0)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
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

//MARK: - ValidateDataDelegate, SignupViewModelDelegate
extension SignupViewController: SignupViewModelDelegate{
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

    //    ValidateDataDelegate
    func showInfo(message: String) {
        let alert = UIAlertController(title: Constants.ValidationMessages.titleModal, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

    
    
}
