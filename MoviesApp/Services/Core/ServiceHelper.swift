//
//  ServiceHelper.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 27.08.2023.
//

import Foundation
import Alamofire

enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

enum Error: Swift.Error{
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

struct ServiceEndPoint{
    static let baseUrl: String = "https://api.themoviedb.org/3/search/movie"
    static let apiKey: String = "60b87c964abe45c9b6a0f56dc5df2e3f"
}

class ServiceHelper{
    static let shared = ServiceHelper()
    let headers: HTTPHeaders = [
        "Content-Type": "application/json;charset=utf-8"
    ]
}
