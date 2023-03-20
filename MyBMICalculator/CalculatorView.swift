//
//  CalculatorView.swift
//  MyBMICalculator
//
//  Created by Haikal Lazuardi Fadil on 20/03/23.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var savedHistories: [Bmi]
    
    func calculateBmi() -> Double {
        return weight * 10000 / pow(height, 2)
    }
    
    var body: some View {
        VStack {
            SliderData(label: "Weight", value: $weight)
            
            SliderData(label: "Height", value: $height)
            
            BMIResult(weight: $weight, height: $height)
            
            Button{
                let newBmi = Bmi(date: Date(), result: calculateBmi())
                savedHistories.insert(newBmi, at: 0)
            } label: {
                Text("Save to History")
                    .frame(maxWidth: .infinity, maxHeight: 36)
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(8)
            .padding(.top, 20)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView( weight: .constant(70), height: .constant(172), savedHistories: .constant([]))
    }
}

struct SliderData: View {
    var label: String
    @Binding var value: Double
    
    var body: some View{
        VStack {
            HStack {
                Text("\(label)")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(Int(value))")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
            }
            Slider(
                value: $value,
                in: 0...200
            )
        }
    }
}

struct BMIResult: View {
    @Binding var weight: Double
    @Binding var height: Double
    
    func calculateBmi() -> Double {
        return weight * 10000 / pow(height, 2)
    }
    
    func bmiScale() -> String {
        switch calculateBmi() {
            case 0 ..< 18.4:
                return "Underweight"
            case 18.5 ..< 24.9:
                return "Normal"
            case 25 ..< 39.9 :
                return "Overweight"
            default:
                return "Obese"
        }
    }
    
    func bmiColor() -> Color {
        switch calculateBmi() {
            case 0 ..< 18.4:
            return .blue
            case 18.5 ..< 24.9:
            return .green
            case 25 ..< 39.9 :
            return .orange
            default:
            return .red
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Body Mass Index")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(String(format: "%.2f", calculateBmi()))")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
            }
            HStack {
                Spacer()
                Text("\(bmiScale())")
                    .foregroundColor(bmiColor())
            }
            
        }
    }
}

