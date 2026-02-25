//
//  TrapezoidAreaView.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 23/02/2026.
//

import SwiftUI
import LaTeXSwiftUI

struct TrapezoidAreaView: View {
    let equation: String = "$$P=\\frac{a+b}{2} \\cdot h$$"
    @State var a: Double?
    @State var b: Double?
    @State var height: Double?
    @State var result: Double?
    @State var stateA: isValid = .success
    @State var stateB: isValid = .success
    @State var stateHeight: isValid = .success
    var body: some View {
        ScrollView {
            VStack {
                LaTeX(equation)
                    .padding()
                Group{
                    VStack{
                        TextField("Podaj wartość górnej podstawy", value: $a, format: .number)
                        if let error = stateA.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                    VStack{
                        TextField("Podaj wartosc dolnej podstawy", value: $b, format: .number)
                        if let error = stateB.errorMessage {
                            Text(error)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                    }
                    VStack{
                        TextField("Podaj wysokość", value: $height, format: .number)
                        if let error = stateHeight.errorMessage {
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
                    let validA = validateNumFields(number: a)
                    stateA = validA
                    let validB = validateNumFields(number: b)
                    stateB = validB
                    let validHeight = validateNumFields(number: height)
                    stateHeight = validHeight
                    if case .success = stateA, case .success = stateB, case .success = stateHeight {
                        let firstValue: Double = ((a ?? 0) + (b ?? 0)) / 2
                        $result.wrappedValue = firstValue * (height ?? 0)
                    } else {
                        result = nil
                    }
                }
                .padding(.top)
                if result != nil {
                    Text("Pole trapezu: \(result ?? 0, specifier: "%.2f")")
                        .padding(.top)
                }
                if result != nil || a != nil || b != nil || height != nil {
                    Button("Wyczyść", role: .destructive) {
                        a = nil
                        b = nil
                        height = nil
                        result = nil
                        stateA = .success
                        stateB = .success
                        stateHeight = .success
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    TrapezoidAreaView()
}
