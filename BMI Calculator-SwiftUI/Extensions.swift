//
//  Extensions.swift
//  BMI Calculator-SwiftUI
//
//  Created by Fatih Sağlam on 23.08.2021.
//


import SwiftUI

extension Color {
    
    public static var bmiDarkerBlue: Color {
        return Color(UIColor(red: 47/255, green: 57/255, blue: 67/255, alpha: 1.0))
    }
    
    public static var bmiDarkBlue: Color {
        return Color(UIColor(red: 37/255, green: 47/255, blue: 57/255, alpha: 1.0))
    }
    
    public static var bmiLightBlue: Color {
        return Color(UIColor(red: 41/255, green: 55/255, blue: 66/255, alpha: 1.0))
    }
    
    public static var bmiLighterBlue: Color {
        return Color(UIColor(red: 103/255, green: 133/255, blue: 146/255, alpha: 1.0))
    }
    
    public static var bmiLightText: Color {
        return Color(UIColor(red: 105/255, green: 136/255, blue: 150/255, alpha: 1.0))
    }
    
}

extension Int {
     var double: Double {
         get { Double(self) }
         set { self = Int(newValue) }
     }
 }
