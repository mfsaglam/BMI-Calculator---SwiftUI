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
        return bmiResult
    }
    
    func getComment(gender: Gender, age: Int, bmi: Double) -> String {
        
        if gender == .female {
            if age < 20 {
                if bmi < 18.5 {
                    return "You are underweight."
                } else if bmi < 24.9 {
                    return "You have ideal weight."
                } else if bmi < 29.9 {
                    return "You are overweight."
                } else {
                    return "You are obese."
                }
            } else {
                if bmi < 18.5 {
                    return "You are underweight."
                } else if bmi < 24.9 {
                    return "You have ideal weight."
                } else if bmi < 29.9 {
                    return "You are overweight."
                } else {
                    return "You are overweight"
                }
            }
        } else {
            if age < 20 {
                if bmi < 18.5 {
                    return "You are underweight."
                } else if bmi < 24.9 {
                    return "You have ideal weight."
                } else if bmi < 29.9 {
                    return "You are overweight."
                } else {
                    return "You are overweight"
                }
            } else {
                if bmi < 18.5 {
                    return "You are underweight."
                } else if bmi < 24.9 {
                    return "You have ideal weight."
                } else if bmi < 29.9 {
                    return "You are overweight."
                } else {
                    return "You are overweight"
                }
            }
        }
    }
    
    enum Gender {
        case female
        case male
    }
}
