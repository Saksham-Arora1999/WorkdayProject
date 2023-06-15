//
//  NetworkManager.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation

// MARK: NetworkLayer Protocol
/// Protocol defined for the network layer
protocol NetworkLayer{
    func fetch(url: String) async throws -> Data
}

// MARK: Network Manager
/// Singleton class:  provides a reusable network layes
class NetworkManager: NetworkLayer{
    
    
    static let instance = NetworkManager()
    
    private init() {}

    /// Contains the type of errors which might be thrown by the Network Layer
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
    
    /// Responsible for making API Calls
    ///
    /// - Parameter url: String which contains the API url
    /// - Returns: Data which need to be decoded by the caller
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
