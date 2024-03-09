//
//  GuessTheFlag.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/03/06.
//

import SwiftUI

struct GuessTheFlag: View {
    var body: some View {
        // case 1
        Image(systemName: "pencil.circle")
            .foregroundColor(.red)
            .font(.largeTitle)
        
        // case 2
        Button {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }

        // case 3
        VStack {
            Button("Button 1", systemImage: "pencil") { }
                .buttonStyle(.bordered)

            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered) // 버튼의 tint색상을 기반으로 자동으로 테두리에 어울리는 색상이 생기는 버튼

            Button("Button 3") { }
                .buttonStyle(.borderedProminent) // 버튼의 tint색상을 기반으로 텍스트가 `눈에 띄도록` 해주는 스타일

//                .tint(.indigo)

            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }
    }

//    var body: some View {
//        Button("This is button", role: .destructive ,action: executeButton)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .foregroundColor(.white)
//        .background(.indigo.gradient)
//    }
//
//    func executeButton() {
//        print("Hello!!")
//    }
}

#Preview {
    GuessTheFlag()
}

