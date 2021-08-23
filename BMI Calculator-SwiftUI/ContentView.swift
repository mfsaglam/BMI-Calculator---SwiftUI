//
//  ContentView.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 23.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    @State var height: Double = 1.0
    @State var weight: Double = 30.0
    @State var age: Int = 1
    @State var result: Double = 0.0
    
    @State var isShowingResult = false
    @State var isMale = false
    @State var kg = true
    @State var cm = true
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.bmiDarkBlue)
                VStack {
                    HStack {
                        GenderButton(isSelected: isMale, icon: "♂", text: "Male")
                            .onTapGesture {
                                isMale.toggle()
                            }
                        GenderButton(isSelected: !isMale, icon: "♀", text: "Female")
                            .onTapGesture {
                                isMale.toggle()
                            }
                    }
                    
                    VStack(alignment: .center, spacing: 40) {
                        SliderView(firstMeasurement: "cm", secondMeasurement: "ft", isFirst: true, sliderValue: height, sliderRange: 1.0...3.0, decimal: 2)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "kg", secondMeasurement: "lb", isFirst: true, sliderValue: weight, sliderRange: 30.0...175.0, decimal: 1)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "age", secondMeasurement: nil, sliderValue: Double(age), sliderRange: 1.0...100.0, decimal: 0)
                            .frame(maxHeight: 100)
                        NavigationLink(
                            destination: ResultView(result: result),
                            isActive: $isShowingResult) {
                            EmptyView()
                        }
                        
                        Button("Calculate") {
                            result = weight / (height * height)
                            isShowingResult = true
                        }
                        .padding(.horizontal)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                
            }
            .navigationTitle("BMI Calculator")
        }
        
    }
}


struct SliderView: View {
    let firstMeasurement: String
    let secondMeasurement: String?
    @State var isFirst: Bool = true
    @State var sliderValue: Double
    let sliderRange: ClosedRange<Double>
    let decimal: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.bmiLightBlue)
                .cornerRadius(15)
            VStack {
                HStack {
                    if secondMeasurement != nil {
                        if isFirst {
                            Text(firstMeasurement)
                            Text(secondMeasurement ?? "")
                                .foregroundColor(.bmiLightText)
                        } else {
                            Text(firstMeasurement)
                                .foregroundColor(.bmiLightText)
                            Text(secondMeasurement ?? "")
                        }
                    } else {
                        Text(firstMeasurement)
                        Text(secondMeasurement ?? "")
                            .foregroundColor(.bmiLightText)
                    }
                    
                    Spacer()
                    Text(String(format: "%.\(decimal)f", sliderValue))
                        .font(.largeTitle)
                        .bold()
                }
                .onTapGesture {
                    isFirst.toggle()
                }
                Slider(value: $sliderValue, in: sliderRange)
                    .accentColor(.red)
            }
            .padding()
        }
    }
}

struct GenderButton: View {
    var isSelected: Bool
    var icon: String
    var text: String
    var body: some View {
        ZStack {
            if isSelected {
                Rectangle()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(.bmiLightBlue)
            } else {
                Rectangle()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(.bmiLighterBlue)
            }
            
            VStack(alignment: .center) {
                if isSelected {
                    Text(icon)
                        .font(.system(size: 60))
                        .foregroundColor(.bmiLightText)
                    Text(text)
                        .foregroundColor(.bmiLightText)
                } else {
                    Text(icon)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Text(text)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ResultView: View {
    var result: Double
    
    var body: some View {
        Text("Your BMI is " + String(format: "%.1f", result))
            .font(.title)
            .bold()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}


