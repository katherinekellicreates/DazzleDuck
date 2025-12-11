//
//  AccsView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct AccsView: View {
    @Environment(\.dismiss) var dismiss
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let selectedClothing: String
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
                Image(selectedClothing).resizable().scaledToFit().frame(width: 480,height: 480)
                Image(accessories[accessoryIndex]).resizable().scaledToFit().frame(width: 480, height: 480)
            }
            HStack(spacing: 150) {
                ArrowButton(direction: .left) { accessoryIndex = (accessoryIndex - 1 + accessories.count) % accessories.count }
                ArrowButton(direction: .right) { accessoryIndex = (accessoryIndex + 1) % accessories.count }
            }
            NavigationLink(destination: FinalView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: selectedHat,selectedClothing: selectedClothing, selectedAccessory: accessories[accessoryIndex])) {
                Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundColor(.green)
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
    NavigationView {
        AccsView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
            selectedClothing: "shirt1",
        )
    }
}
