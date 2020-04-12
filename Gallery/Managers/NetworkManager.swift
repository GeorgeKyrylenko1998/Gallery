//
//  NetworkManager.swift
//  Gallery
//
//  Created by George Kyrylenko on 12.04.2020.
//  Copyright © 2020 George Kyrylenko. All rights reserved.
//

import Foundation

class NetworkManager{
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
    
    enum RequesMethod: String{
        case GET
        case POST
        case PUT
    }
    
    func makeRequest(url: String,
                     method: RequesMethod,
                     body: Data? = nil,
                     completion: @escaping (Result<Data?>) -> Void){
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.addValue("Client-ID A2n7o9ufRgHorBm2TE_WiU4gUFDDQB4aUpBD04GwyOg", forHTTPHeaderField: "Authorization")
        request.httpBody = body
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else{
                completion(.failure(error!))
                return
            }
            completion(.success(data))
        }
    }
}
