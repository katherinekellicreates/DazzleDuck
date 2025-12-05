//
//  HatView.swift
//  DazzleDuck
//
//  Created by Katherine Pizzirusso on 12/4/25.
//

import SwiftUI

import SwiftUI

struct HatView: View {
    let selectedDuck: String
    let selectedEyes: String

    let hats = ["hat1", "hat2", "hat3"]   // make sure these exist in Assets
    @State private var hatIndex = 0

    var body: some View {
        VStack(spacing: 20) {

            Text("Pick a hat!")
                .font(.largeTitle)

            ZStack {
                Image(selectedDuck)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Image(selectedEyes)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Image(hats[hatIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }

            // Arrows to switch hats
            HStack(spacing: 150) {
                Button {
                    hatIndex = (hatIndex - 1 + hats.count) % hats.count
                } label: {
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .foregroundColor(.black)
                }

                Button {
                    hatIndex = (hatIndex + 1) % hats.count
                } label: {
                    Image(systemName: "arrowshape.right.fill")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .foregroundColor(.black)
                }
            }

            // Green checkmark (can go to next screen later)
            Button {
                print("Hat selected: \(hats[hatIndex])") // placeholder
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}

// Preview for HatsView
#Preview {
    NavigationView {
        HatView(
            selectedDuck: "duck1",
            selectedEyes: "eyes1"
        )
    }
}

