//
//
// Werddinary
// Word.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import Foundation

struct Word: Identifiable, Codable {
    var id: UUID = UUID()
    let word: String
    let results: [WordResult]?
    
    private enum CodingKeys: String, CodingKey {
        case word, results
    }
}

// Model for the "results" array
struct WordResult: Identifiable, Codable {
    let id: UUID = UUID()
    let definition: String?
    let partOfSpeech: String?
    let synonyms: [String]?
    let antonyms: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case definition, partOfSpeech, synonyms, antonyms
    }
}
