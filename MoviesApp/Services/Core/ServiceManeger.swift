//
//  ServiceManeger.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 27.08.2023.
//

import Foundation
import Alamofire

final class ServicesManegers: ServiceProtocol{
    
    static let shared = ServicesManegers()
    init(){}
    
    func fetchMovies(parameters: [String : String]?, completion: @escaping ((Results<MovieModel>)) -> ()) {
        
        let url = "\(ServiceEndPoint.baseUrl)?api_key=\(ServiceEndPoint.apiKey)"
        
        AF.request(url, method: .get, parameters: parameters, headers: ServiceHelper.shared.headers).responseData{ response in
            switch response.result{
                
            case.success(let data):
                let decoder = JSONDecoder()
                
                do{
                    let result = try decoder.decode(MovieModel.self, from: data)
                    completion(.succes(result))
                }catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
                
            }
        }
    }
}
