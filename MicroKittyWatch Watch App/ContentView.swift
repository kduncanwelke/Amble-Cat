//
//  ContentView.swift
//  MicroKittyWatch Watch App
//
//  Created by Katherine Duncan-Welke on 9/23/24.
//  Copyright © 2024 Kate Duncan-Welke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let stepViewModel = StepViewModel()
    private let viewModel = ViewModel()
    @ObservedObject var data = WatchDataModel.shared
    
    var availableImages = ["back", "front", "left", "leftblink", "leftsit", "leftsitblink", "leftsittail", "right", "rightblink", "rightsit", "rightsitblink", "rightsittail", "sideleft", "sideright", "sitblink", "sitting", "sleep1"]
       
       var body: some View {
           ZStack {
               Color(Colors.peach).ignoresSafeArea()
           
               VStack {
                   ZStack {
                       Color(Colors.pink).ignoresSafeArea()
                       VStack {
                           Text("\(data.distance)m")
                               .font(.custom("Dogica_Pixel", size: 12))
                               .foregroundStyle(.black)
                               .padding(.bottom, 5)
                           Text("\(data.stepCount)")
                               .font(.custom("04b30", size: 30))
                               .foregroundStyle(.black)
                       }
                       .padding(.bottom, 15)
                   }
                   
                   .padding(.bottom, 5)
                   
                   Image(availableImages.randomElement() ?? "leftsit")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 160, height: 104)
                       .padding(.bottom, 5)
                   
                   HStack {
                       Image("paw")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 30, height: 30)
                       Text("\(data.points) points")
                           .font(.custom("Dogica_Pixel", size: 12))
                           .foregroundStyle(.black)
                   }
                   
                   .padding(.bottom, 5)
               }
           }
       }
}

#Preview {
    ContentView()
}