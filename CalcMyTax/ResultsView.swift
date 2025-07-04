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

        PieChartView(data: taxBreakdown,
                     title: "Tax Detailing",
                     legend: "Distribution (%)"
        )
        .padding()
        .frame(width: 500, height: 500)
    }
}

#Preview {
    ResultsView()
}
