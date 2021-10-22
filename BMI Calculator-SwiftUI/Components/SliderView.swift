//
//  SliderView.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 30.08.2021.
//

import SwiftUI

struct SliderView: View {
    
    let firstMeasurement: String
    let secondMeasurement: String?
    
    @State var isFirst: Bool = true
    @Binding var sliderValue: Double
    
    let firstSliderRange: ClosedRange<Double>
    let secondSliderRange: ClosedRange<Double>?
    let decimal: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.bmiLightBlue)
                .cornerRadius(15)
            VStack {
                HStack {
                    if secondMeasurement != nil {
                        Text(firstMeasurement)
                            .foregroundColor(isFirst ? .white : .bmiLightText)
                        Text(secondMeasurement ?? "")
                            .foregroundColor(isFirst ? .bmiLightText : .white)
                    } else {
                        Text(firstMeasurement)
                    }
                    
                    Spacer()
                    Text(String(format: "%.\(decimal)f", sliderValue))
                        .font(.system(.body, design: .monospaced))
                        .bold()
                }
                .onTapGesture {
                    isFirst.toggle()
                }
                Slider(value: $sliderValue, in: isFirst ? firstSliderRange : secondSliderRange ?? firstSliderRange)
                    .accentColor(.red)
            }
            .padding()
        }
    }
}
