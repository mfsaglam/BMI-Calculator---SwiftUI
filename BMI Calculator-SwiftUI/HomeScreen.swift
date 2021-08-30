//
//  ContentView.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 23.08.2021.
//

import SwiftUI

struct HomeScreen: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    lazy var viewModel = HomeScreenViewModel()
    
    @State var height: Double = 1.0
    @State var weight: Double = 30.0
    @State var age: Int = 2
    @State var result: Double = 0.0
    
    var gender: BmiCalculator.Gender {
        if isMale {
            return .male
        } else {
            return .female
        }
    }
    
    @State var isShowingResult = false
    @State var isMale = false
    @State var kg = true
    @State var cm = true
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color.bmiDarkBlue
                    .ignoresSafeArea()
                
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
                        SliderView(firstMeasurement: "m", secondMeasurement: "ft", isFirst: true, sliderValue: height, firstSliderRange: 1.0...2.5, secondSliderRange: 3.0...10.0, decimal: 2)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "kg", secondMeasurement: "lb", isFirst: true, sliderValue: weight, firstSliderRange: 30.0...175.0, secondSliderRange: 60.0...385.0, decimal: 1)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "age", secondMeasurement: nil, sliderValue: Double(age), firstSliderRange: 2.0...120.0, secondSliderRange: nil, decimal: 0)
                            .frame(maxHeight: 100)
//                        NavigationLink(
//                            destination: ResultView(result: result),
//                            isActive: $isShowingResult) {
//                            EmptyView()
//                        }
                        
                        Button("Calculate") {
                            //viewModel.getBmiResult(height: height, weight: weight)
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
        .sheet(isPresented: self.$isShowingResult) {
            ResultView(result: result)
        }
    }
}


struct SliderView: View {
    
    let firstMeasurement: String
    let secondMeasurement: String?
    
    @State var isFirst: Bool = true
    @State var sliderValue: Double
    
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
                        .font(.largeTitle)
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

struct ResultView: View {
    @State var result: Double
    
    var body: some View {
        ZStack {
            Color.bmiDarkBlue
                .ignoresSafeArea()
            Text("Your BMI is " + String(format: "%.1f", result))
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScreen()
            
        }
    }
}


