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
    
    private let baseURL = "https://api.unsplash.com/"
    private let getPhotosPath = "photos"
    
    static let shared = NetworkManager()
    
    private init(){}
    
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
        }.resume()
    }
    
    func getPhotos(page: Int,
                   completion: @escaping (Result<[PhotoModel]>) -> Void){
        let url = "\(baseURL)\(getPhotosPath)?page=\(page)"
        makeRequest(url: url, method: .GET) { (result) in
            switch result{
            case .success(let data):
                guard let data = data else {return}
                do{
                    let photos = try JSONDecoder().decode([PhotoModel].self, from: data)
                    completion(.success(photos))
                } catch {
                    completion(.failure(error))
                }
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
