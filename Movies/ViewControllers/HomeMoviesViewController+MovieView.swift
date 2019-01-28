//
//  HomeMoviesViewController+MovieView.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 13/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

protocol MovieView {
    func stopLoad()
    func startLoad()
    func reloadCollection()
    func showMessageSearch()
    func hideMessageSearch()
}

extension HomeMoviesViewController: MovieView {
   
    func stopLoad() {
        collectionView.isHidden = false
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        collectionView.isHidden = true
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
    
    func showMessageSearch(){
        searchMessageView.isHidden = false
    }
    
    func hideMessageSearch() {
        searchMessageView.isHidden = true
    }
}
