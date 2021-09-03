//
//  HomeScreenViewModel.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 28.08.2021.
//

import SwiftUI

class HomeScreenViewModel: ObservableObject {

    var model = BmiCalculator()

    func getBmiResult(height: Double, weight: Double) -> Double {
        let bmiResult = model.calculateBmi(height: height, weight: weight)
        return bmiResult
    }

    func getComment(gender: BmiCalculator.Gender, age: Int, bmi: Double) -> String {
        return model.getComment(gender: gender, age: age, bmi: bmi)
    }
}
