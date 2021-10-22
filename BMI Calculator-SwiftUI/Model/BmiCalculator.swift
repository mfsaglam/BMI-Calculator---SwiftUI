//
//  BmiCalculator.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 28.08.2021.
//

import Foundation

struct BmiCalculator {
    
    
    func calculateBmi(height: Double, weight: Double) -> Double {
        let bmiResult = weight / (height * height)
        print(bmiResult)
        return bmiResult
    }
    
    func getBmiType(gender: Gender, age: Int, bmi: Double) -> BMIResult {
        
        if gender == .female {
            if age < 20 {
                if bmi < 18.5 {
                    return .underweight
                } else if bmi < 24.9 {
                    return .idealWeight
                } else if bmi < 29.9 {
                    return .overWeight
                } else {
                    return .obese
                }
            } else {
                if bmi < 18.5 {
                    return .underweight
                } else if bmi < 24.9 {
                    return .idealWeight
                } else if bmi < 29.9 {
                    return .overWeight
                } else {
                    return .obese
                }
            }
        } else {
            if age < 20 {
                if bmi < 18.5 {
                    return .underweight
                } else if bmi < 24.9 {
                    return .idealWeight
                } else if bmi < 29.9 {
                    return .overWeight
                } else {
                    return .obese
                }
            } else {
                if bmi < 18.5 {
                    return .underweight
                } else if bmi < 24.9 {
                    return .idealWeight
                } else if bmi < 29.9 {
                    return .overWeight
                } else {
                    return .obese
                }
            }
        }
    }
}

enum Gender {
    case female
    case male
}

enum BMIResult {
    case underweight, idealWeight, overWeight, obese
}
