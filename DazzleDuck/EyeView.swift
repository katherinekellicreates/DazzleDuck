//
//  EyeView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct EyeView: View {
    @Environment(\.dismiss) var dismiss // back button
    let selectedDuck: String
    let eyes = ["eyes1", "eyes2", "eyes3"]
    @State private var eyeIndex = 0
    
    var body: some View {
        ZStack {
            Color("AccentColor").ignoresSafeArea(.all)
                VStack(spacing: 20) {
                    CustomText4(text: "Pick your duck’s eyes!")
                        .multilineTextAlignment(.center)
                    ZStack {
                        Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                        
                        Image(eyes[eyeIndex]).resizable().scaledToFit().frame(width: 480, height: 480).allowsHitTesting(false) // so buttons work
                    }
                    
                    HStack(spacing: 150) {
                        ArrowButton(direction: .left) {eyeIndex = (eyeIndex - 1 + eyes.count) % eyes.count }
                        ArrowButton(direction: .right) {eyeIndex = (eyeIndex + 1) % eyes.count }
                    }
                    NavigationLink(destination: HatView(selectedDuck: selectedDuck, selectedEyes: eyes[eyeIndex])) {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundStyle(Color("Color"))
                    }
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                }
                .padding()
            // back button
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
    }
#Preview {
    NavigationView {
        EyeView(selectedDuck: "duck1")
    }
}
