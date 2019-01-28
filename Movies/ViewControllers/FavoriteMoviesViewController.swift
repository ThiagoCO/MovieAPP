//
//  FavoriteMoviesViewController.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 20/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var viewModel:FavoriteMoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FavoriteMoviesViewModel()
        self.stepTableView()
    }
}
