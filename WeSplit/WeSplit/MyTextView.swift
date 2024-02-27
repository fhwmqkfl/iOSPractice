//
//  MyTextView.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/02/26.
//

import SwiftUI

struct MyTextView: View {
    @State private var index: Int = 0

    // background array
    private let backGroundColors = [
        Color.red,
        Color.green,
        Color.blue,
        Color.yellow,
        Color.orange,
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("Index \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            Spacer()
        }
        .background(backGroundColors[index])
        .onTapGesture {
            if (self.index == self.backGroundColors.count - 1) {
                self.index = 0
            } else {
                self.index += 1
            }
        }
    }
}

#Preview {
    MyTextView()
}
