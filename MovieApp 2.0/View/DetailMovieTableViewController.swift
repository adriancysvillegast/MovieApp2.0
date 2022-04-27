//
//  DetailMovieTableViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 26/4/22.
//

import UIKit
import ChameleonFramework

class DetailMovieTableViewController: UITableViewController {
    
    let detailMovieViewModel = DetailMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 1000
        configuration()
        binding()
        registerXib()
    }
    
    func configuration(){
        detailMovieViewModel.load()
        detailMovieViewModel.fetchData()
    }
    func binding(){
        detailMovieViewModel.refresh = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func registerXib(){
        tableView.register(UINib(nibName: Constants.Xibs.nibNameDetail , bundle: nil), forCellReuseIdentifier: Constants.Xibs.identifierCell)
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailMovieViewModel.detailMovie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Xibs.identifierCell, for: indexPath) as! DetailMovieTableViewCell
        
        let detail = detailMovieViewModel.detailMovie[indexPath.row]
        cell.titleLabel.text = detail.original_title
        cell.overviewLabel.text = detail.overview
        cell.adultLabel.text = String(detail.adult)
        cell.budgetLabel.text = String(detail.budget)
        cell.genresLabel.text = detail.genres
        cell.idLabel.text = String(detail.id)
        cell.originalLenguajeLabel.text = detail.original_language
        cell.popularityLabel.text = String(detail.popularity)
        cell.productionCompaniesLabel.text = detail.production_companies
        cell.productionCountriesLabel.text = detail.production_countries
        cell.releaseDateLabel.text = detail.release_date
        cell.runtimeLabel.text = String(detail.runtime ?? 0)
        cell.spokenLanguagesLabel.text = detail.spoken_languages
        cell.statusLabel.text = detail.status
        cell.voteAverageLabel.text = String(detail.vote_average)
        cell.voteCountLabel.text = String(detail.vote_count)
        return cell
    }
    
    
}
//MARK: - DetailMovieViewModelDelegate
extension DetailMovieTableViewController: DetailMovieViewModelDelegate{
    func presentError(error: UIAlertController) {
        present(error, animated: true)
    }
    
    
}
