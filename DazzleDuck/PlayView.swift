//
//  PlayView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        CustomText2(text: "What color is your duck?")
            .multilineTextAlignment(.center)
        VStack {
            Image("yellow").resizable().frame(width: 480, height: 480)
        }
        HStack {
            Button(action: {}) {
                Text("")
            }
            .buttonStyle(CustomButtonStyle3())
            Spacer()
                .frame(width: 150)
            Button(action: {}) {
                Text("")
            }
            .buttonStyle(CustomButtonStyle4())
        }
        Spacer()
    }
}

#Preview {
    PlayView()
}
struct CustomText2: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50))
    }
}
struct CustomButtonStyle2: ButtonStyle {
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
struct CustomButtonStyle3: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "arrowshape.left.fill")
            .resizable()
            .frame(width: 60, height: 50)
            .opacity(configuration.isPressed ? 0.0: 1.0)
    }
}
struct CustomButtonStyle4: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "arrowshape.right.fill")
            .resizable()
            .frame(width: 60, height: 50)
            .opacity(configuration.isPressed ? 0.0: 1.0)
    }
}
