//
//  ContentView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 11/17/25.
//

import SwiftUI

// resuable stuff

//arrows
struct ArrowButton: View {
    enum Direction { case left, right }
    let direction: Direction
    let action: () -> Void
        
    var body: some View {
        Button(action: action) {
            Image(systemName: direction == .left ? "arrowshape.left.fill" : "arrowshape.right.fill")
                .resizable()
                .frame(width: 60, height: 50)
                .foregroundColor(.black)
        }
    }
}
// pretty text
struct CustomText: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 60 )) } }
struct CustomText2: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 39 )) } }
struct CustomText4: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 44 )) } }
struct CustomText5: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50 )) } }
struct CustomText6: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50 )) } }

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
                .padding()
            }
            .navigationViewStyle(.stack)
        }
    }

#Preview {
    ContentView()
}
