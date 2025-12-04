//
//  ContentView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 11/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomText(text: "DazzleDuck")
                Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
struct CustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 60))
    }
}
