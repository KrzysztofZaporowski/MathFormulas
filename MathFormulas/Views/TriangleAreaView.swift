//
//  TriangleAreaView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI
import LaTeXSwiftUI

struct TriangleAreaView: View {
    let equation: String = "$$P = \\frac{a \\cdot h}{2}$$"
    @State var a: Double?
    @State var h: Double?
    @State var result: Double?
    @State var validationA: isValid = .success
    @State var validationH: isValid = .success
    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation)
                    .padding()
                Group {
                    VStack {
                        TextField("Podaj podstawe trójkąta", value: $a, format: .number)
                        if let error = validationA.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                    VStack {
                        TextField("Podaj wysokość trójkąta", value: $h, format: .number)
                        if let error = validationH.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .padding(.horizontal)
                .padding(.top)
                Button("Oblicz"){
                    let statusA = validateNumFields(number: a)
                    validationA = statusA
                    let statusH = validateNumFields(number: h)
                    validationH = statusH
                    if case .success = statusA, case .success = statusH {
                        $result.wrappedValue = (a ?? 0) * (h ?? 0) / 2
                    } else {
                        result = nil
                    }
                }
                .padding(.top)
                if result != nil {
                    Text("Pole trójkąta: \(result ?? 0, specifier: "%.2f")")
                        .padding(.top)
                }
                if a != nil || h != nil {
                    Button("Wyczyść", role: .destructive) {
                        a = nil
                        h = nil
                        result = nil
                        validationA = .success
                        validationH = .success
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    TriangleAreaView()
}
