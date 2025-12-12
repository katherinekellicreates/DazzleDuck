//
//  FinalView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct FinalView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedColor: Color
    let selectedDuck: String
    let selectedEyes: String
    let selectedHat: String
    let selectedClothing: String
    let selectedAccessory: String
    
    var body: some View {
        ZStack {
            selectedColor.ignoresSafeArea()
            VStack(spacing: 20) {
                CustomText2(text: "Your Final Duck!")
                    .multilineTextAlignment(.center)
                
                ZStack {
                    Image(selectedDuck).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedEyes).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedHat).resizable().scaledToFit().frame(width: 480, height: 480)
                    Image(selectedClothing).resizable().scaledToFit().frame(width: 480,height: 480)
                    Image(selectedAccessory).resizable().scaledToFit().frame(width: 480, height: 480)
                }
                NavigationLink(destination: ContentView()) {
                    HStack {
                        CustomText2(text: "Dress another duck?").foregroundColor(.black)
                        Image(systemName: "arrow.trianglehead.counterclockwise").font(.system(size: 40)).foregroundColor(.white)
                    }
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
    NavigationStack {
        FinalView(
            selectedColor: .constant(.pink),
            selectedDuck: "duck1",
            selectedEyes: "eyes1",
            selectedHat: "hat1",
            selectedClothing: "shirt1",
            selectedAccessory: "acc1"
        )
    }
}
