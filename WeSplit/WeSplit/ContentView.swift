//
//  ContentView.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tabCount = 0

    var body: some View {
//        Button("Tab Count : \(tabCount)") {
//            tabCount += 1
//        }
        HStack{
            VStackView()
            VStackView()
            VStackView()
        }
        .padding(10)
        .background(.yellow)

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
