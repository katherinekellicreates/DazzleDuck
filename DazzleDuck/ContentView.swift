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
                .foregroundColor(.white)
        }
    }
}
// pretty text
struct CustomText: View { let text: String; var body: some View { Text(text).font(Font.custom("ChristmasWish-Calligraphy", size: 90 )).foregroundColor(.white) } }
struct CustomText2: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 38 )) .foregroundColor(.white) } }
struct CustomText4: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 44 )).foregroundColor(.white)  } }
struct CustomText5: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50 )).foregroundColor(.white)  } }
struct CustomText6: View { let text: String; var body: some View { Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50 )).foregroundColor(.white)  } }

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea(.all)
                VStack {
                    CustomText(text:" DazzleDuck ") //works with font
                    Spacer()
                    NavigationLink(destination: PlayView()) {
                        Text("Play")
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(Color("AccentColor"))
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
}

#Preview {
    ContentView()
}
