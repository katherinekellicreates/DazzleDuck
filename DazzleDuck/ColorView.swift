//
//  ColorView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/11/25.
//

import SwiftUI

struct ColorView: View {
    @State private var color = Color("AccentColor")
    @Environment(\.dismiss) var dismiss
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let selectedClothing: String
    let selectedAccessory: String
    
    var body: some View {
        ZStack {
            color.ignoresSafeArea()
            
            VStack(spacing: 20) {
                CustomText2(text: "Pick a background color!")
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                ColorPicker("", selection: $color)
                    .labelsHidden()
                    .padding()
                
                ZStack {
                    Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedClothing).resizable().scaledToFit().frame(width: 480,height: 480)
                    Image(selectedAccessory).resizable().scaledToFit().frame(width: 480, height: 480)
                }
                NavigationLink(destination: FinalView(selectedColor: $color, selectedDuck: selectedDuck, selectedEyes: selectedEyes, selectedHat: selectedHat,selectedClothing: selectedClothing, selectedAccessory: selectedAccessory)){
                    Image(systemName: "checkmark.circle.fill").font(.system(size: 50)).foregroundStyle(Color("Color"))
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
        ColorView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
            selectedClothing: "shirt1",
            selectedAccessory: "acc1"
        )
    }
