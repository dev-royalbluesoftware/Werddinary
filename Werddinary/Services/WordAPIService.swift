//
//
// Werddinary
// WordAPIService.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import Foundation

struct WordAPIService {
    
    // MARK: - API Results
    
    static let apiKey = APIConfig.apiKey
    static let headers = [
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
    ]
    
    private let baseURL = "https://wordsapiv1.p.rapidapi.com/words"
    
    // MARK: - Fetch Random Word
    
    func fetchRandomWord() async throws -> Word {
        // API Endpoint
        let url = URL(string: "\(baseURL)/?random=true")!
        
        // Create URLRequest with headers
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = WordAPIService.headers
        
        // async/await Fetch data
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // check for valid response
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // Decode JSON data into Word model
        let decoder = JSONDecoder()
        let word = try decoder.decode(Word.self, from: data)
        return word
    }
}
