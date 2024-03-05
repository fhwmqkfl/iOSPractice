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
    @State private var unit: String = "meters"
    @State private var resultUnit: String = "kilometers"

    let unitSet = ["meters","kilometers","feet","miles"]
    
    var targetAmount: Measurement<UnitLength> {
        var amount: Measurement<UnitLength>
        if unit == "meters" {
            amount = Measurement(value: inputData, unit: UnitLength.meters)
        } else if unit == "kilometers" {
            amount = Measurement(value: inputData, unit: UnitLength.kilometers)
        } else if unit == "feet" {
            amount = Measurement(value: inputData, unit: UnitLength.feet)
        } else {
            amount = Measurement(value: inputData, unit: UnitLength.miles)
        }

        return amount.converted(to: .meters)
    }
    
    var resultAmount: Double {
        var amount: Measurement<UnitLength>
        let targetAmount = targetAmount
        if resultUnit == "meters" {
            amount = targetAmount
        } else if resultUnit == "kilometers" {
            amount = targetAmount.converted(to: .kilometers)
        } else if resultUnit == "feet" {
            amount = targetAmount.converted(to: .feet)
        } else {
            amount = targetAmount.converted(to: .miles)
        }

        return amount.value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Number") {
                    TextField("input", value: $inputData, format: .number )

                    Picker("Unit", selection: $unit) {
                        ForEach(unitSet, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)

                }

                Section("Output Number") {
                    Text(resultAmount, format: .number)

                    Picker("ResultUnit", selection: $resultUnit) {
                        ForEach(unitSet, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)

                }

            }
            .navigationTitle("Length Conversion")
        }
    }
}

#Preview {
    FirstChallenge()
}
