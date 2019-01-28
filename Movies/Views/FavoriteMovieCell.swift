//
//  TableViewCell.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 20/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import SDWebImage

class FavoriteMovieCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movie:MovieFavoriteDb, url:URL) {
        imageViewMovie.sd_setImage(with: url)
        labelName.text = movie.title
        labelYear.text = movie.dateMovie
        labelDescription.text = movie.descriptionMovie
    }
    
}
