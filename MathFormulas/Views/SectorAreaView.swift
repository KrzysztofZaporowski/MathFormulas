//
//  SectorAreaView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI
import LaTeXSwiftUI

struct SectorAreaView: View {
    let equation: String = "$$P=\\frac{\\alpha}{360^\\circ} \\cdot \\pi r^2$$"
    @State var radius: Double?
    @State var angle: Double?
    @State var result: Double?
    @State var statusRadius: isValid = .success
    @State var statusAngle: isValid = .success
    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation)
                    .padding()
                Group {
                    VStack{
                        TextField("Podaj wartość kątu", value: $angle, format: .number)
                        if let error = statusAngle.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                    VStack{
                        TextField("Podaj promień koła", value: $radius, format: .number)
                        if let error = statusRadius.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                .padding(.top)
                Button("Oblicz") {
                    let statusA = validateNumFields(number: angle)
                    statusAngle = statusA
                    let statusR = validateNumFields(number: radius)
                    statusRadius = statusR
                    if case .success = statusAngle, case .success = statusRadius {
                        let factor = (angle ?? 0) / 360
                        let area = Double.pi * pow(radius ?? 0, 2)
                        $result.wrappedValue = factor * area
                    } else {
                        result = nil
                    }
                }
                .padding(.top)
                if result != nil {
                    Text("Pole wycinka koła: \(result ?? 0, specifier: "%.2f")")
                        .padding(.top)
                }
                if radius != nil || angle != nil || result != nil {
                    Button("Wyczyść", role: .destructive) {
                        radius = nil
                        angle = nil
                        result = nil
                        statusAngle = .success
                        statusRadius = .success
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    SectorAreaView()
}
