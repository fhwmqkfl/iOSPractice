//
//  GuessTheFlag.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/03/06.
//

import SwiftUI

struct GuessTheFlag: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue

            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background()
        }
    }
}

#Preview {
    GuessTheFlag()
}

