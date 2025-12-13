//
//  HatView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct HatView: View {
    @Environment(\.dismiss) var dismiss // back button
    let selectedDuck: String
    let selectedEyes: String
    let hats = ["hat1", "hat2", "hat3", "hat4", "hat5", "hat6", "hat7", "hat8", "hat9", "hat10", "hat11", "hat12", "hat13", "hat14"]
    @State private var hatIndex = 0
    
    var body: some View {
        ZStack {
            Color("AccentColor").ignoresSafeArea(.all)
            VStack(spacing: 20) {
                
                CustomText6(text: "Pick a hat!")
                    .multilineTextAlignment(.center)
                ZStack {
                    Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(hats[hatIndex]).resizable().scaledToFit().frame(width: 480, height: 480)
                }
                HStack(spacing:150) {
                    ArrowButton(direction: .left) { hatIndex = (hatIndex - 1 + hats.count) % hats.count }
                    ArrowButton(direction: .right) { hatIndex = (hatIndex + 1) % hats.count }
                }
                NavigationLink(destination: ClothingView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: hats[hatIndex])) {
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
            NavigationStack {
                HatView(
                    selectedDuck: "duck1",
                    selectedEyes: "eyes1"
                )
            }
        }
