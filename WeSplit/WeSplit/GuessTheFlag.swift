//
//  GuessTheFlag.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/03/06.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var showingAlert = false

    var body: some View {
        Button("show alert") {
            showingAlert = true
        }
        .alert("import message", isPresented: $showingAlert) {
            Button("delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
        }

        Text("showingAlert: \(String(showingAlert))")
    }
}

#Preview {
    GuessTheFlag()
}

