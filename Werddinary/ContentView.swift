//
//
// Werddinary
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                HeaderView()
                    .padding(.bottom, 20)
                
                RandomWordView()
                    .shadow(radius: 15)
            }
            .padding([.leading, .trailing], 24)
            
            Spacer()
        }
        .background(.softIndigo.opacity(0.2))
    }
}

#Preview {
    ContentView()
}
