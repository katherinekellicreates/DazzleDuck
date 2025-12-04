//
//  ContentView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 11/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CustomText(text: "DazzleDuck")
                    Spacer()
                    NavigationLink(destination: PlayView()) {
                        Text("Play")
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(.pink)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Spacer()
                }
            }
        }
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
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100)
            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
            .padding()
            .background(.pink).opacity(configuration.isPressed ? 0.0: 1.0)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}
