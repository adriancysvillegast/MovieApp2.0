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
    let detailVC = DetailXIBViewController()
//    let optionsTabViewController = OptionsTabViewController()
    let localRealm = try! Realm()
    private var allMovies : Results<TopMovieRealm>?

    let topMovieViewModel = TopMovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70
//        navigationItem.hidesBackButton = true
        configuration()
        load()
        registerXib()
    }
    
    func registerXib(){
        tableView.register(UINib(nibName: Constants.Xibs.nibName, bundle: nil), forCellReuseIdentifier: Constants.Xibs.identifierCell)
        
        
    }
    
    func configuration(){
        
        DispatchQueue.main.async {
            self.topMovieViewModel.fetchDataTopMovie()
        }
        self.tableView.reloadData()
    }
    
    func load(){
        allMovies = localRealm.objects(TopMovieRealm.self)
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allMovies?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Xibs.identifierCell, for: indexPath) as! TopMovieTableViewCell
        
        
        if let movie = allMovies?[indexPath.row]{
            cell.titleLabel.text = movie.original_title
            cell.backgroundCell.backgroundColor = UIColor(hexString: movie.color_Hex)
            
            if let backColor = UIColor(hexString: movie.color_Hex){
                cell.titleLabel.textColor = ContrastColorOf(backColor, returnFlat: true)
            }
            
        }else {
            cell.titleLabel.text = "We have a error retriving Date from API"
        }
        
        
        
        return cell
    }
    
    
    
    
    

    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
//        esto esta trabajando como quiero solo me falta agregar a favorito
        conectToViewDetailXIB()
    }

    func conectToViewDetailXIB(){
        let viewDetail = DetailXIBViewController(nibName: Constants.Xibs.viewDetail, bundle: nil)
        navigationController?.pushViewController(viewDetail, animated: true)
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
//MARK: - SearchBar

extension TopMoviesTableViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            load()
            registerXib()
        }
    }
}
