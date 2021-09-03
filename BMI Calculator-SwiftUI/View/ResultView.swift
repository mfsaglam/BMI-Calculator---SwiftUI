//
//  ResultView.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 30.08.2021.
//

import SwiftUI

struct ResultView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var comment: String
    @Binding var result: Double
    
    var body: some View {
        ZStack {
            Color.bmiDarkBlue
                .ignoresSafeArea()
            VStack(spacing: 40.0) {
                Spacer()
                Text("Your BMI is " + String(format: "%.1f", result))
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("\(comment)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                        presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.bmiLighterBlue)
                            .frame(height: 70)
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(comment: .constant("Your weight is pretty good."), result: .constant(30.0))
    }
}
