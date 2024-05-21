//
//  ContentView.swift
//  Micro Kitty Watch Watch App
//
//  Created by Katherine Duncan-Welke on 5/18/24.
//  Copyright © 2024 Kate Duncan-Welke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let stepViewModel = StepViewModel()
    private let viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color(Colors.peach).ignoresSafeArea()
        
            VStack {
                ZStack {
                    Color(Colors.pink).ignoresSafeArea()
                    VStack {
                        Text("\(stepViewModel.stepsToday())")
                            .font(.custom("Dogica_Pixel_Bold", size: 30))
                            .foregroundStyle(.black)
                        Text("\(stepViewModel.distanceToday()) \(stepViewModel.distanceMeasure())")
                            .font(.custom("Dogica_Pixel", size: 12))
                            .foregroundStyle(.black)
                    }
                    .padding(.bottom, 10)
                }
                
                .padding(.bottom, 5)
                
                HStack {
                    Image("paw")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("\(viewModel.setPointsLabel()) paw points")
                        .font(.custom("Dogica_Pixel", size: 12))
                        .foregroundStyle(.black)
                }
                
                Image("right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 104)
            }
            
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ContentView()
}
