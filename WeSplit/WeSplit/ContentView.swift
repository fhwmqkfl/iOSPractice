//
//  ContentView.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isActivated: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    VStackView()
                    VStackView()
                    VStackView()
                }
                    .padding(isActivated ? 50 : 10)
                    .background(isActivated ? .yellow : .black)
                    .onTapGesture {
                        // add animation
                        withAnimation {
                            self.isActivated.toggle()
                        }
                } // HStack

                NavigationLink(destination: MyTextView()) {
                    Text("네비게이션")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .padding()
                        .background(.orange)
                        .foregroundStyle(.white)
                        .cornerRadius(30)
                } .padding(50)
            }
        } // NavigationStack
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
