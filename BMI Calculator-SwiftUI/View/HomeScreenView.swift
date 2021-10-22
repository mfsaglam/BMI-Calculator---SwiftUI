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
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color.bmiDarkBlue
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        GenderButton(isSelected: viewModel.isMale, icon: "♂", text: "Male")
                            .onTapGesture {
                                withAnimation {
                                    viewModel.switchGender(value: "Female")
                                }
                            }
                        
                        GenderButton(isSelected: !viewModel.isMale, icon: "♀", text: "Female")
                            .onTapGesture {
                                withAnimation {
                                    viewModel.switchGender(value: "Male")
                                }
                            }
                    }
                    
                    VStack(alignment: .center, spacing: 40) {
                        SliderView(firstMeasurement: "m", secondMeasurement: "ft", isFirst: true, sliderValue: $viewModel.height, firstSliderRange: 1.0...2.5, secondSliderRange: 3.0...10.0, decimal: 2)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "kg", secondMeasurement: "lb", isFirst: true, sliderValue: $viewModel.weight, firstSliderRange: 30.0...175.0, secondSliderRange: 60.0...385.0, decimal: 1)
                            .frame(maxHeight: 100)
                        SliderView(firstMeasurement: "age", secondMeasurement: nil, sliderValue: $viewModel.age.double, firstSliderRange: 2.0...120.0, secondSliderRange: nil, decimal: 0)
                            .frame(maxHeight: 100)
                        NavigationLink(
                            destination: ResultView(),
                            isActive: $viewModel.isShowingResult) {
                            EmptyView()
                        }
                        
                        Button("Calculate") {
                            viewModel.result = viewModel.getBmiResult()
                            viewModel.comment = viewModel.getComment()
                            viewModel.isShowingResult = true
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
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            HomeScreenView()
    }
}


