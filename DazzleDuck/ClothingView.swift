//
//  ClothingView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct ClothingView: View {
    @Environment(\.dismiss) var dismiss
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    
    let clothes = ["shirt1", "shirt2", "shirt3"]
    @State private var clothingIndex = 0
    
    var body: some View {
        ZStack {
            Color("AccentColor").ignoresSafeArea(.all)
            VStack(spacing: 20) {
                CustomText2(text: "Pick clothes!")
                    .multilineTextAlignment(.center)
                
                ZStack {
                    Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(clothes[clothingIndex]).resizable().scaledToFit().frame(width: 480,height: 480)
                }
                HStack(spacing: 150) {
                    ArrowButton(direction: .left) { clothingIndex = (clothingIndex - 1 + clothes.count) % clothes.count }
                    ArrowButton(direction: .right) { clothingIndex = (clothingIndex + 1) % clothes.count }
                }
                NavigationLink(destination: AccsView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: selectedHat, selectedClothing: clothes[clothingIndex])) {
                    Image(systemName: "checkmark.circle.fill").font(.system(size: 50))
                        .foregroundStyle(Color("Color"))
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
}
#Preview {
    NavigationView {
        ClothingView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
        )
    }
}
