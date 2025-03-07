//
//
// Werddinary
// RandomWordView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct RandomWordView: View {
    
    // MARK: - @State Properties
    
    @State private var isLoading = false
    
    // MARK: - Properties
    
    private let wordService: WordAPIService
    private let viewModel: RandomWordViewModel
    
    init() {
        self.wordService = WordAPIService()
        self.viewModel = RandomWordViewModel(wordService: self.wordService)
    }
    
    var body: some View {
        ZStack {
            Color.lightOrange
            
            VStack {
                WordView(word: viewModel.randomWord, partOfSpeech: viewModel.partOfSpeech, definition: viewModel.definition)
                    .padding([.top, .horizontal], 24)
                
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Button {
                        Task {
                            isLoading = true
                            await viewModel.generateRandomWord()
                            isLoading = false
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.white)
                    }
                    .padding([.bottom, .trailing], 16)
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.generateRandomWord()
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    RandomWordView()
}
