//
//
// Werddinary
// HeaderView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Werddinary.")
                .font(.largeTitle).fontWeight(.black)
                
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.softIndigo)
        }
    }
}

#Preview {
    HeaderView()
}
