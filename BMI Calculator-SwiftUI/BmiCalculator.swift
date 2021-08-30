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
                if bmi < 15 {
                    return "You are underweight."
                } else if bmi < 25 {
                    return "You have ideal weight."
                } else {
                    return "You are overweight."
                }
            } else {
                if bmi < 20 {
                    return "You are underweight."
                } else if bmi < 30 {
                    return "You have ideal weight."
                } else {
                    return "You are overweight."
                }
            }
        } else {
            if age < 20 {
                if bmi < 15 {
                    return "You are underweight."
                } else if bmi < 25 {
                    return "You have ideal weight."
                } else {
                    return "You are overweight."
                }
            } else {
                if bmi < 20 {
                    return "You are underweight."
                } else if bmi < 30 {
                    return "You have ideal weight."
                } else {
                    return "You are overweight."
                }
            }
        }
    }
    
    enum Gender {
        case female
        case male
    }
    
}
