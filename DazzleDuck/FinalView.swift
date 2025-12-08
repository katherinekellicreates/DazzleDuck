//
//  FinalView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct FinalView: View {
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let selectedAccessory: String
    let selectedClothing: String
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            CustomText2(text: "Your Final Duck!")
                .multilineTextAlignment(.center)
            
            ZStack {
                Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedAccessory).resizable().scaledToFit().frame(width: 480, height: 480)
                Image(selectedClothing).resizable().scaledToFit().frame(width: 480,height: 480)
            }
            NavigationLink(destination: ContentView()) {
                HStack {
                    CustomText2(text: "Dress another duck?").foregroundColor(.black)
                    Image(systemName: "arrow.trianglehead.counterclockwise").font(.system(size: 40)).foregroundColor(.black)
                }
            }
            .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
        }
        .padding()
    }
}
#Preview {
    NavigationView {
        FinalView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
            selectedAccessory: "acc1",
            selectedClothing: "shirt1"
        )
    }
}
