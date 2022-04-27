//
//  DetailMovieTableViewCell.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 26/4/22.
//

import UIKit

class DetailMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var originalLenguajeLabel: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var productionCompaniesLabel: UILabel!
    @IBOutlet weak var productionCountriesLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var spokenLanguagesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
