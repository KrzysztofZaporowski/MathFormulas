//
//  ContentView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI

struct ContentView: View {
    let names = ["Twierdzenie Pitagorasa", "Pole trójkąta", "Pole koła", "Pole wycinka koła", "Pole trapezu"]
    
    var body: some View {
        ZStack {
            List(names, id: \.self) { name in
                DisclosureGroup(name) {
                    switch name {
                    case "Twierdzenie Pitagorasa":
                        PythagoreanTheoremView()
                    case "Pole trójkąta":
                        TriangleAreaView()
                    case "Pole koła":
                        CircleAreaView()
                    case "Pole wycinka koła":
                        SectorAreaView()
                    case "Pole trapezu":
                        TrapezoidAreaView()
                    default:
                        Text("Not implemented")
                    }
                }
            }
        }
        .overlay(alignment: .top) {
            Color.clear
                .background(.ultraThinMaterial)
                .frame(height: 50)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
