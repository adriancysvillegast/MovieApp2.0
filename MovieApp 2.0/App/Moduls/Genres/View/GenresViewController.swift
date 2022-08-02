//
//  GenresViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 31/7/22.
//

import UIKit

class GenresViewController: UIViewController {
    //MARK: - properties
    private lazy var viewModel: GenreViewModel = {
        let viewModel = GenreViewModel()
        viewModel.delegateSpinner = self
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var atableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GenreTableViewCell.self, forCellReuseIdentifier: GenreTableViewCell().identifier)
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
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        viewModel.getGenres()
    }
    
    //MARK: - setupView
    private func setupView(){
        title = "Genres"
        view.backgroundColor = .white
        view.addSubview(atableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            atableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            atableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            atableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            atableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension GenresViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.genresCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell().identifier, for: indexPath) as! GenreTableViewCell
        let data = viewModel.showGenres(index: indexPath.row)
        cell.configureCell(model: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
//MARK: - GenreViewModelDelegate, SpinnerLoadDelegate
extension GenresViewController: GenreViewModelDelegate, SpinnerLoadDelegate{
    func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    
    func reloadData() {
        atableView.reloadData()
    }
    
    func showProperties() {
        [atableView].forEach {
            $0.isHidden = false
        }
    }
    
    func hideProperties() {
        [atableView].forEach {
            $0.isHidden = true
        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.ErrorMessages.title, message: Constants.ErrorMessages.didErrorGenre, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
