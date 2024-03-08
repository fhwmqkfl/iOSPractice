//
//  FirstChallenge.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/03/04.
//

import SwiftUI

// Length unit conversions app
struct FirstChallenge: View {
    @State private var inputData: Double = 0
    @State private var inputUnit = UnitLength.meters
    @State private var resultUnit = UnitLength.kilometers
    @FocusState private var inputIsFocused: Bool

    let unitSet: [UnitLength] = [.feet, .miles, .kilometers, .meters]
    let formatter: MeasurementFormatter

    var result: String {
        let inputMeasurement = Measurement(value: inputData, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: resultUnit)
        return formatter.string(from: outputMeasurement)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Number") {
                    TextField("input", value: $inputData, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                    Picker("Unit", selection: $inputUnit) {
                        ForEach(unitSet, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Output Number") {
                    Text(result)

                    Picker("ResultUnit", selection: $resultUnit) {
                        ForEach(unitSet, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .pickerStyle(.segmented)

                }

            }
            .navigationTitle("Length Conversion")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }

    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long

    }
}

#Preview {
    FirstChallenge()
}
