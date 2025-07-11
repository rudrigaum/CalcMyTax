//
//  ResultsView.swift
//  CalcMyTax
//
//  Created by Rodrigo Cerqueira Reis on 04/07/25.
//

import SwiftUI
import SwiftUICharts

struct ResultsView: View {
    
    var taxBreakdown: [Double] = [5, 10, 15]
    
    var body: some View {
        VStack {

            PieChartView(data: taxBreakdown,
                         title: "Tax Detailing",
                         legend: "Distribution (%)"
            )
            Text("Before Tax")
                .font((.system(size: 32)))
            Text("$100.000,00")
            Text("After Tax")
                .font((.system(size: 32)))
            Text("$65.000,00")
                .padding(.bottom)
            Text("Post Tax Salary")
            ProgressView("", value: 20, total: 100)
                .tint(.orange)
            Text("Tax")
            ProgressView("", value: 20, total: 100)
                .tint(.orange)
            Text("National Insurance")
            ProgressView("", value: 20, total: 100)
                .tint(.orange)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ResultsView()
}
