//
//
// Werddinary
// RandomWordViewModel.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import Foundation

@Observable
final class RandomWordViewModel {
    
    // MARK: - Properties
    
    private let wordService: WordAPIService
    
    var randomWord = ""
    var partOfSpeech = ""
    var definition = ""
    
    // MARK: - Custom Initializer
    
    init(wordService: WordAPIService) {
        self.wordService = wordService
    }
    
    // MARK: - Generate Random Word
    
    func generateRandomWord() async {
        do {
            let randomWordResponse = try await wordService.fetchRandomWord()
            self.randomWord = randomWordResponse.word
            
            // handle optional results
            if let firstResult = randomWordResponse.results?.first {
                self.partOfSpeech = firstResult.partOfSpeech ?? ""
                self.definition = firstResult.definition ?? ""
                
            } else {
                self.partOfSpeech = "Unknown"
                self.definition = "No Definition Available"
            }
        } catch {
            print("Error fetching random word: \(error)")
        }
    }
}
