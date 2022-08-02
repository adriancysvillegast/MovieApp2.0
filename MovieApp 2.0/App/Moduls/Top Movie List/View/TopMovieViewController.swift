//
//  TopMovieViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 10/7/22.
//

import UIKit


class TopMovieViewController: UIViewController{
    
    //MARK: - Properties

    private lazy var viewModel: TopMovieViewModel = {
        let viewModel = TopMovieViewModel()
        viewModel.delegate = self
        viewModel.delegateSpinner = self
        return viewModel
    }()
    
    
    lazy var atableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopMovieCustomCell.self, forCellReuseIdentifier: TopMovieCustomCell().identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = .medium
        spinner.isHidden = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies"
        setupView()
        setupConstrainst()
        
        viewModel.getTopMovie()
    }
    
    //MARK: - SetupView
    func setupView() {
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        view.addSubview(atableView)
        view.addSubview(spinner)
    }
    
    func setupConstrainst(){
        NSLayoutConstraint.activate([
            atableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            atableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            atableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            atableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension TopMovieViewController: UITableViewDelegate, UITableViewDataSource {
//    UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.topMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopMovieCustomCell().identifier, for: indexPath) as! TopMovieCustomCell
        
        let movie = viewModel.showTopMovie(index: indexPath.row)
        cell.configureCell(model: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailMovieViewController()
        vc.idMovie = viewModel.showTopMovie(index: indexPath.row).id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - TopMovieViewModelDelegate
extension TopMovieViewController: TopMovieViewModelDelegate, SpinnerLoadDelegate {
    func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    func hideProperties() {
        [atableView].forEach { view in
            view.isHidden = true
        }
    }
    
    func showProperties() {
        [atableView].forEach { view in
            view.isHidden = false
        }
    }

    func didError(message: String) {
        let alert = UIAlertController(title: Constants.ErrorMessages.title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

    func reloadData() {
        atableView.reloadData()
    }
}
