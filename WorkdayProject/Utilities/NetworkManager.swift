//
//  NetworkManager.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation

protocol NetworkLayer{
    func fetch(url: String) async throws -> Data
}

class NetworkManager: NetworkLayer{
    
    
    static let instance = NetworkManager()
    
    private init() {}

    enum NetworkingError: LocalizedError {
        case badServerRespone
        case connectionTimedOut
        case brokenURL
        
        var errorDescription: String? {
            switch self {
            case .badServerRespone: return "Bad Server Response"
            case .connectionTimedOut: return "Connection Timed out"
            case .brokenURL: return "Broken URL"
            }
        }
    }
    
    
    func fetch(url: String) async throws -> Data {
        
        guard let url = URL(string: url)
        else {throw NetworkingError.brokenURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let res = response as? HTTPURLResponse,
              res.statusCode >= 200 && res.statusCode < 300
        else {throw NetworkingError.badServerRespone}
        
        return data
    }
}
