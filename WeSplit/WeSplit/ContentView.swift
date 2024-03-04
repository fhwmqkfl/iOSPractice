//
//  ContentView.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPrice: Double {
        let tipSection = 1 + Double(tipPercentage) / 100
        let total = checkAmount * tipSection

        return total
    }

    var totalPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            // 식사에 얼마를 내야하는 계산하는 폼
            Form {
                // 가격입력 폼 & 키보드는 숫자만
                // 사람이 몇명인지 선택하는화면
                // 팁이 얼마인지 확인하는 화면
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section("How much do you want to tip?") {
                    Picker("tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                // 원래 총 금액
                Section("Total Amount") {
                    Text(totalPrice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

                // 화면 보여주는 폼
                Section("Amount per person") {
                    Text(totalPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("weSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
