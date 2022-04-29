//
//  TopMoviesTableViewController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 23/4/22.
//

import UIKit
import RealmSwift
import Alamofire
import ChameleonFramework

class TopMoviesTableViewController: UITableViewController {
    
    let localRealm = try! Realm()
    let topMovieViewModel = TopMovieViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        topMovieViewModel.deleteTopMovie()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //edit cell
        tableView.rowHeight = 70
        
        configuration()
        binding()
        
        registerXib()
    }
    
    
    func registerXib(){
        tableView.register(UINib(nibName: Constants.Xibs.nibNameTopM, bundle: nil), forCellReuseIdentifier: Constants.Xibs.identifierCell)
    }
    
    func configuration(){
        topMovieViewModel.fetchDataTopMovie()
    }
    
    func binding(){
        self.topMovieViewModel.refresh = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return topMovieViewModel.topMovieArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Xibs.identifierCell, for: indexPath) as! TopMovieTableViewCell
        
            cell.titleLabel.text = topMovieViewModel.topMovieArray[indexPath.row].originalTitle
            let color = topMovieViewModel.topMovieArray[indexPath.row].colorHex
            cell.backgroundCell.backgroundColor = UIColor(hexString: color)
    
            if let contras = UIColor(hexString: color){
                cell.titleLabel.textColor = ContrastColorOf(contras , returnFlat: true)
            }
        return cell
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        topMovieViewModel.createObject(with: topMovieViewModel.topMovieArray[indexPath.row])
        performSegue(withIdentifier: Constants.Segues.goToDetails, sender: self)
    }
    
    
}
//MARK: - SearchBar Delegate
extension TopMoviesTableViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            configuration()
            binding()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        topMovieViewModel.searchTitle(searchBar: searchBar.text)
        binding()
    }
}

//MARK: - TopMovieViewModelDelegate
extension TopMoviesTableViewController: TopMovieViewModelDelegate{
    
    func presentError(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
