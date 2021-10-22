//
//  HomeScreenViewModel.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 28.08.2021.
//

import SwiftUI

class HomeScreenViewModel: ObservableObject {

    private var model = BmiCalculator()
    
    @Published var height: Double = 1.0
    @Published var weight: Double = 30.0
    @Published var age: Int = 2
    @Published var result: Double = 0.0
    
    @Published var isShowingResult = false
    @Published var isMale = false
    @Published var kg = true
    @Published var cm = true
    @Published var comment = ""
    
    var gender: Gender {
        return isMale ? .male : .female
    }

    func getBmiResult() -> Double {
        print("height: \(height), weight: (\(weight)")
        result = model.calculateBmi(height: height, weight: weight)
        print("and the result is : \(result)")
        return result
    }

    func getComment() -> String {
        let bmitype = model.getBmiType(gender: gender, age: age, bmi: result)
        comment = bmitype == .underweight ? "You are underweight." :
        bmitype == .idealWeight ? "You are ideal weight." :
        bmitype == .overWeight ? "You are overweight." :  "You are obese."
        return comment
    }
    
    func switchGender(value: String) {
        isMale = value == "Male" ? true : false
    }
}
