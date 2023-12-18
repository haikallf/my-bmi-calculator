//
//  HistoryView.swift
//  MyBMICalculator
//
//  Created by Haikal Lazuardi Fadil on 20/03/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var savedHistories: [BMI]
    
    var body: some View {
        List(savedHistories) { bmi in
            VStack (alignment: .leading) {
                Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.gray)
                HStack {
                    Text("\(String(format: "%.2f", bmi.result))")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(bmi.bmiScale())")
                        .font(.title2)
                        .foregroundColor(bmi.bmiColor())
                }
                .padding(.top, -4)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            savedHistories: .constant([BMI(date: Date(), result: 12.52)]))
    }
}
