//
//
// Werddinary
// WordView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct WordView: View {
    
    // MARK: - Properties
    
    let word: String
    let partOfSpeech: String
    let definition: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                Text(word)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(partOfSpeech)
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            Text(definition)
                .font(.body)
        }
    }
}

#Preview {
    WordView(word: "Programming", partOfSpeech: "noun", definition: "The process of designing and writing a set of instructions (code) that tell a computer how to perform specific tasks.")
}
