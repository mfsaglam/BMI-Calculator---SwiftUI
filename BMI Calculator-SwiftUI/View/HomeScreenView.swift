//
//  ContentView.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 23.08.2021.
//

import SwiftUI

struct HomeScreenView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @StateObject var viewModel = HomeScreenViewModel()
    
    @State var height: Double = 1.0
    @State var weight: Double = 30.0
    @State var age: Int = 2
    @State var result: Double = 0.0
    
    @State var isShowingResult = false
    @State var isMale = false
    @State var kg = true
    @State var cm = true
    @State var comment = ""
    
    var gender: BmiCalculator.Gender {
        if isMale {
            return .male
        } else {
            return .female
        }
    }
    
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
                        SliderView(firstMeasurement: "m", secondMeasurement: "ft", isFirst: true, sliderValue: $height, firstSliderRange: 1.0...2.5, secondSliderRange: 3.0...10.0, decimal: 2)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "kg", secondMeasurement: "lb", isFirst: true, sliderValue: $weight, firstSliderRange: 30.0...175.0, secondSliderRange: 60.0...385.0, decimal: 1)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "age", secondMeasurement: nil, sliderValue: $age.double, firstSliderRange: 2.0...120.0, secondSliderRange: nil, decimal: 0)
                            .frame(maxHeight: 100)
                        NavigationLink(
                            destination: ResultView(comment: $comment, result: $result),
                            isActive: $isShowingResult) {
                            EmptyView()
                        }
                        
                        Button("Calculate") {
                            result = viewModel.getBmiResult(height: height, weight: weight)
                            comment = viewModel.getComment(gender: self.gender, age: self.age, bmi: self.result)
                            print(result, comment)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScreenView()
        }
    }
}


