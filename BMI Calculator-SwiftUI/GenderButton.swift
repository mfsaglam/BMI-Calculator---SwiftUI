//
//  GenderButton.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 30.08.2021.
//

import SwiftUI

struct GenderButton: View {
    var isSelected: Bool
    var icon: String
    var text: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(30)
                .padding()
                .foregroundColor(isSelected ? .bmiLightBlue : .bmiLighterBlue)
                .animation(.easeIn(duration: 0.1))
            
            VStack(alignment: .center) {
                Text(icon)
                    .font(.system(size: 60))
                    .foregroundColor(isSelected ? .bmiLightText : .white)
                    .animation(Animation.easeIn(duration: 0.1))
                Text(text)
                    .foregroundColor(isSelected ? .bmiLightText : .white)
                    .animation(.easeIn(duration: 0.1))
            }
        }
    }
}

struct GenderButton_Previews: PreviewProvider {
    static var previews: some View {
        GenderButton(isSelected: true, icon: "", text: "")
    }
}
