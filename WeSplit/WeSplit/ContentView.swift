//
//  ContentView.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    // 텍스트(name)이 변경되면 동시에 textfield에도 표시가 되어야함
    // 2way binding -> $
    let students = ["coco", "harry", "rob"]
    @State private var selectedStudent = "coco"

    var body: some View {
        NavigationStack {
            Form {
                Picker("select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a student")
        }
    }
}

struct VStackView: View {
    var body: some View {
        VStack{
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("2!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            Text("3!")
                .font(.system(size: 60))
                .fontWeight(.bold)
        }
        .background(.orange)
    }
}

#Preview {
    ContentView()
}
