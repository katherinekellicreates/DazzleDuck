//
//  HatView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct HatView: View {
    let selectedDuck: String
    let selectedEyes: String
    let hats = ["hat1", "hat2", "hat3"]
    @State private var hatIndex = 0
    
    var body: some View {
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
            NavigationLink(destination: AccsView(selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: hats[hatIndex])) {
                Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundColor(.green)
            }
            .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
        }
        .padding()
    }
}
#Preview {
    NavigationView {
        HatView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1"
        )
    }
}
