//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 22.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailOverWiev: UILabel!
    
    public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            updateDetailMovie(movie: movie)
            
        }
    }
    
    private func updateDetailMovie(movie: Movie){
        
        detailImg.loadImage(url: URL(string: movie.movieImage)!)
        imdb.text = String(movie.voteAverage)
        date.text = movie.date
        detailTitle.text = movie.title
        detailOverWiev.text = movie.overView
    }
}
