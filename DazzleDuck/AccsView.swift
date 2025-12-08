//
//  AccsView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct AccsView: View {
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let accessories = ["acc1", "acc2", "acc3"]
    @State private var accessoryIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            CustomText5(text:"Pick accessories!")
                .multilineTextAlignment(.center)
            ZStack {
                Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(accessories[accessoryIndex]).resizable().scaledToFit().frame(width: 480, height: 480)
            }
            HStack(spacing: 150) {
                ArrowButton(direction: .left) { accessoryIndex = (accessoryIndex - 1 + accessories.count) % accessories.count }
                ArrowButton(direction: .right) { accessoryIndex = (accessoryIndex + 1) % accessories.count }
            }
            NavigationLink(destination: ClothingView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: selectedHat, selectedAccessory: accessories[accessoryIndex])) {
                Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundColor(.green)
            }
            .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
            }
        .padding()
        }
    }
#Preview {
    NavigationView {
        AccsView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1"
        )
    }
}
