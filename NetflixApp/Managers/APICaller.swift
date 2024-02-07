//
//  APICaller.swift
//  NetflixApp
//
//  Created by Vlad Babaev on 03.02.2024.
//

import Foundation

struct Constants {
    static let API_KEY = "ec184becc0a551d20978c49859863834"
    static let BASE_URL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMoves(_ completion: @escaping (Result<[Title], Error>)  -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")
            else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, _, error) in
                guard let data = data, error == nil else {return}
                
                do {
                    let results = try JSONDecoder().decode(TitlesResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        
        task.resume()
    }
    
    func getTVs(_ completion: @escaping (Result<[Title], Error>)  -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/tv/day?api_key=\(Constants.API_KEY)")
            else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, _, error) in
                guard let data = data, error == nil else {return}
                
                do {
                    let results = try JSONDecoder().decode(TitlesResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(_ completion: @escaping (Result<[Title], Error>)  -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)")
            else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, _, error) in
                guard let data = data, error == nil else {return}
                
                do {
                    let results = try JSONDecoder().decode(TitlesResponse.self.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        
        task.resume()
    }
    
    func getPopularMovies(_ completion: @escaping (Result<[Title], Error>)  -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/popular?api_key=\(Constants.API_KEY)")
            else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, _, error) in
                guard let data = data, error == nil else {return}
                
                do {
                    let results = try JSONDecoder().decode(TitlesResponse.self.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        
        task.resume()
    }
    
    func getTopRated(_ completion: @escaping (Result<[Title], Error>)  -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/top_rated?api_key=\(Constants.API_KEY)")
            else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, _, error) in
                guard let data = data, error == nil else {return}
                
                do {
                    let results = try JSONDecoder().decode(TitlesResponse.self.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedToGetData))
                }
        }
        
        task.resume()
    }
}
