//
//  CircleAreaView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI
import LaTeXSwiftUI

struct CircleAreaView: View {
    let equation: String = "$$P=\\pi r^2$$"
    @State var radius: Double?
    @State var result: Double?
    @State private var validationStatus: isValid = .success
    
    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation)
                    .padding()
                Group {
                    TextField("Podaj promień koła", value: $radius, format: .number)
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)
                .padding(.top)
                if let error = validationStatus.errorMessage {
                    Text(error)
                        .foregroundStyle(Color.red)
                        .font(.caption)
                }
                Button("Oblicz") {
                    let status = validateNumFields(number: radius)
                    validationStatus = status
                    if case .success = status {
                        $result.wrappedValue = pow(Double(radius ?? 0), 2) * .pi
                    } else {
                        result = nil
                    }
                }
                .padding(.top)
                if result != nil {
                    Text("Pole koła: \(result!, specifier: "%.2f")")
                        .padding(.top)
                }
                if radius != nil || result != nil {
                    Button("Wyczyść", role: .destructive) {
                        result = nil
                        radius = nil
                        validationStatus = .success
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    CircleAreaView()
}
