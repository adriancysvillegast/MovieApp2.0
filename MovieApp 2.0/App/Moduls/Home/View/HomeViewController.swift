//
//  HomeViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 14/7/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    private lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    /**Top movies Properties **/
    private lazy var titleTopMovie: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Top Rated 20 Movies"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var seeAllTopMovieButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .black)
        button.tintColor = .black
        return button
    }()
    
    private lazy var collectionViewTopMovie: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(TopMovieCell.self, forCellWithReuseIdentifier: TopMovieCell().identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    /**Categories Properties **/
    private lazy var titleCategories: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Categories"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionViewCategories: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var aTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupView()
        
        viewModel.getTopMovies()
    }
    
    //MARK: - SetupViews
    
    
    private func setupView() {
        view.backgroundColor = .white
        
        [titleTopMovie, collectionViewTopMovie].forEach {
            view.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([
            titleTopMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleTopMovie.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            collectionViewTopMovie.topAnchor.constraint(equalTo: titleTopMovie.bottomAnchor, constant: 5),
            collectionViewTopMovie.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionViewTopMovie.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionViewTopMovie.heightAnchor.constraint(equalToConstant: 250),
            
        ])
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: - DELEGATE: UICollectionViewFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTopMovieCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMovieCell().identifier, for: indexPath) as? TopMovieCell else {
            return UICollectionViewCell()
            }
        cell.configureCell(model: viewModel.getTopMovie(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case collectionViewTopMovie:
            return CGSize(width: view.frame.width/3, height: 250)
        default:
            break
        }
        return CGSize(width: view.frame.width, height: 200)
    }
}

//MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func reload() {
        collectionViewTopMovie.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.ErrorMessages.title, message: Constants.ErrorMessages.didError, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    
}
