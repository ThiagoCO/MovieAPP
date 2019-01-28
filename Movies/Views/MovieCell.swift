//
//  HomeMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 13/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!

    
    func configMovieCell(name:String, img:String?, favorite:Bool) {
    
        
       imageView.sd_setImage(with: URL(string: img!), completed: { (image, error, cacheType, url) in
            //self.activityView.isHidden = true
       })
        
        labelName.text = name
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
       // layer.cornerRadius = 8
        let image = favorite ?  UIImage(named: "favorite_full_icon")?.withRenderingMode(.alwaysOriginal) :  UIImage(named: "favorite_gray_icon")?.withRenderingMode(.alwaysOriginal)
        
        buttonFavorite.setImage(image, for: .normal)
        
    }
}
