//
//  PlayView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct PlayView: View {
    @Environment(\.dismiss) var dismiss
    let ducks = ["duck1","duck2","duck3","duck4","duck5","duck6","duck7","duck8","duck9","duck10","duck11","duck12"]
    
    @State private var duckIndex = 0
    var body: some View {
        VStack {
            CustomText2(text: "What color is your duck?")
                .multilineTextAlignment(.center)
            Image(ducks[duckIndex]).resizable().scaledToFit().frame(width: 480, height: 480)
            
            HStack(spacing: 150) {
                ArrowButton(direction: .left) { duckIndex = (duckIndex - 1 + ducks.count) % ducks.count }
                ArrowButton(direction: .right) { duckIndex = (duckIndex + 1) % ducks.count }
            }
            NavigationLink(destination: EyeView(selectedDuck: ducks[duckIndex])) {
                Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundStyle(Color.green)
            }
            .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                        
                    }
                }
            }
        }
    }
}
    #Preview {
        NavigationStack {
            PlayView()
        }
    }
