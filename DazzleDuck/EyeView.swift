//
//  EyeView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

struct EyeView: View {
    
    let selectedDuck: String     // Pass the selected duck from PlayView
    let eyes = ["eyes1", "eyes2", "eyes3"]
    @State private var eyeIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            
            CustomText4(text: "Pick your duck’s eyes!")
                .multilineTextAlignment(.center)
            ZStack {
                // Base duck
                Image(selectedDuck)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 480, height: 480)
                
                // Eyes overlay
                Image(eyes[eyeIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 480, height: 480)
                    .allowsHitTesting(false) // ensures buttons still respond
            }
            
            HStack(spacing: 150) {
                Button {
                    eyeIndex = (eyeIndex - 1 + eyes.count) % eyes.count
                } label: {
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .foregroundColor(.black)
                }
                
                Button {
                    eyeIndex = (eyeIndex + 1) % eyes.count
                } label: {
                    Image(systemName: "arrowshape.right.fill")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .foregroundColor(.black)
                }
            }
            NavigationLink(
                destination: HatView(
                    selectedDuck: selectedDuck,
                    selectedEyes: eyes[eyeIndex]
                )
            ) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.green)
            }
        }
        .padding()
    }
}

struct CustomText4: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Bodoni 72 Oldstyle", size: 50))
    }
}
#Preview {
    NavigationView {
        EyeView(selectedDuck: "duck1")
    }
}
