//
//  PythagoreanTheoremView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI
import LaTeXSwiftUI

struct PythagoreanTheoremView: View {
    let equation: String = "$$a^2 + b^2 = c^2$$"
    @State var a: Double?
    @State var b: Double?
    @State var result: Double?
    @State var validationA: isValid = .success
    @State var validationB: isValid = .success
    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation)
                    .padding()
                Group{
                    VStack{
                        TextField("Podaj długość a", value: $a, format: .number)
                        if let error = validationA.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                    VStack {
                        TextField("Podaj długość b", value: $b, format: .number)
                        if let error = validationB.errorMessage {
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
                    let statusA = validateNumFields(number: a)
                    validationA = statusA
                    let statusB = validateNumFields(number: b)
                    validationB = statusB
                    if case .success = statusA, case .success = statusB {
                        $result.wrappedValue = sqrt(pow(a ?? 0, 2) + pow(b ?? 0, 2))
                    } else {
                        result = nil
                    }
                }
                .padding(.top)
                if result != nil {
                    Text("Wynik: c = \(result ?? 0, specifier: "%.2f")")
                        .padding(.top)
                }
                if a != nil || b != nil {
                    Button("Wyczyść", role: .destructive) {
                        a = nil
                        b = nil
                        result = nil
                        validationA = .success
                        validationB = .success
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    PythagoreanTheoremView()
}
