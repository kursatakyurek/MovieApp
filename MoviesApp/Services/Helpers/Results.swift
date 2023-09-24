//
//  Results.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 7.08.2023.
//

import Foundation

enum Results<Value>{
    case succes(Value)
    case failure(Error)
}
