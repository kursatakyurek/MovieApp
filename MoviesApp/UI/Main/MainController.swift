//
//  ViewController.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 7.08.2023.
//

import UIKit

class MainController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchMovie: UISearchBar!
    @IBOutlet weak var movieList: UITableView!
    
    var services: ServicesManegers = ServicesManegers()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func load(searchText: String){
        
        services.fetchMovies(parameters: ["query":searchText]){[weak self](response) in
            switch response{
            case .succes(let data):
                self?.movies = data.results
                self?.movieList.reloadData()
            case .failure(let error):
                print("Hata", error)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchValue = searchText
        if searchValue.count >= 3{
            load(searchText: searchValue.lowercased())
        }else{
            self.movies = []
            movieList.reloadData()
        }
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.count == 0 {
            let cell = movieList.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
            let cell = movieList.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
            cell.movieImage.loadImage(url: URL(string: movies[indexPath.row].movieImage)!)
            cell.movieTitleLabel.text = movies[indexPath.row].title
            cell.movieDetailLabel.text = movies[indexPath.row].overView
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if movies.count > 0 {
            
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "DetailVC") as! DetailViewController
            let movie = movies[indexPath.row]
            vc.movie = movie
            show(vc, sender: nil)
        }
        
    }
    
}

