//
//  APIService.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import UIKit

struct APIService {
    // MARK: - Errors
    enum RequestError: Error, Equatable {
        
        case invalidRequest
        case failedToDecode
        case fileNotFound
        case custom(error: Error)
        
        static func == (lhs: APIService.RequestError, rhs: APIService.RequestError) -> Bool {
            lhs.localizedDescription == rhs.localizedDescription
        }
    }
    
    func fetch<T: Codable>(_ url: URL = urlExample,
                           type: T.Type) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            
            throw RequestError.invalidRequest
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
    
    func loadData<T: Codable>(forResource: String = "MockJson", withExtension: String = "json")  async throws -> T {
        
        guard let url = Bundle.main.url(forResource: forResource, withExtension: withExtension) else {
            print("Json file not found")
            
            throw RequestError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            
            return decodedData
            
        } catch {
            throw RequestError.failedToDecode
        }
    }
}

let urlExample = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Bras%C3%ADlia?unitGroup=us&key=GVKLEVE6P9LFVSUT3US5K6Z8Q&contentType=json")!
