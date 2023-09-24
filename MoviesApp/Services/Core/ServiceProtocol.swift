//
//  ServiceProtocol.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 7.08.2023.
//

import Foundation
import Alamofire

protocol ServiceProtocol{
    func fetchMovies(parameters: [String: String]?, completion: @escaping((Results<MovieModel>)) -> ())
}
