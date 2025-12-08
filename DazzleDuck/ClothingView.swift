//
//  ClothingView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct ClothingView: View {
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let selectedAccessory: String

    let clothes = ["shirt1", "shirt2", "shirt3"]
    @State private var clothingIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            CustomText2(text: "Pick clothes!")
                .multilineTextAlignment(.center)

            ZStack {
                Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedAccessory).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(clothes[clothingIndex]).resizable().scaledToFit().frame(width: 480,height: 480)
            }
            HStack(spacing: 150) {
                ArrowButton(direction: .left) { clothingIndex = (clothingIndex - 1 + clothes.count) % clothes.count }
                ArrowButton(direction: .right) { clothingIndex = (clothingIndex + 1) % clothes.count }
            }
            NavigationLink(destination: FinalView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: selectedHat, selectedAccessory: selectedAccessory,selectedClothing: clothes[clothingIndex])) {
                Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundColor(.green)
            }
            .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
            }
        .padding()
        }
    }

#Preview {
    NavigationView {
        ClothingView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
            selectedAccessory: "acc1"
        )
    }
}
