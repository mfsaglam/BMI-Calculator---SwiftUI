//
//  HomeScreenViewModel.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 28.08.2021.
//

import SwiftUI

class HomeScreenViewModel {
    
    lazy var model = BmiCalculator()
    
    func getBmiResult(height: Double, weight: Double) -> String {
        let bmiResult = model.calculateBmi(height: height, weight: weight)
        return String(format: "%.2f", bmiResult)
    }
}
