//
//  ResultsView.swift
//  CalcMyTax
//
//  Created by Rodrigo Cerqueira Reis on 04/07/25.
//

import SwiftUI
import SwiftUICharts
import Charts


struct ResultsView: View {
    
    let annualSalary: Double

    @State private var taxBreakdown: [Double] = []
    @State private var beforeTaxSalary: Double = 0.0
    @State private var afterTaxSalary: Double = 0.0
    @State private var postTaxPercentage: Double = 0.0
    @State private var taxPercentage: Double = 0.0
    @State private var nationalInsurancePercentage: Double = 0.0

    var body: some View {
        VStack {
            
            if !taxBreakdown.isEmpty && taxBreakdown.reduce(0, +) > 0 {
                PieChartView(data: taxBreakdown,
                             title: "Detalhamento de Impostos",
                             legend: "Distribuição (%)"
                )
                .frame(height: 250)
            } else {
                Text("Não há dados válidos para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            }

            Text("Salário Antes dos Impostos")
                .font(.system(size: 20, weight: .bold))
            Text(beforeTaxSalary, format: .currency(code: "BRL"))
                .font(.system(size: 32, weight: .regular))
                .foregroundColor(.green)

            Text("Salário Líquido")
                .font(.system(size: 20, weight: .bold))
            Text(afterTaxSalary, format: .currency(code: "BRL"))
                .font(.system(size: 32, weight: .regular))
                .foregroundColor(.blue)
                .padding(.bottom)

            VStack(alignment: .leading, spacing: 10) {
                Text("Salário Líquido (%)")
                ProgressView("", value: postTaxPercentage, total: 100)
                    .tint(.green)

                Text("Imposto (%)")
                ProgressView("", value: taxPercentage, total: 100)
                    .tint(.red)

                Text("INSS (%)")
                ProgressView("", value: nationalInsurancePercentage, total: 100)
                    .tint(.blue)
            }
            .padding(.horizontal)
        }
        .padding()
        .onAppear {
            calculateTaxBreakdown()
        }
        .navigationTitle("Resultados do Cálculo")
    }

    func calculateTaxBreakdown() {
        beforeTaxSalary = annualSalary
        
        let taxRate = 0.15
        let nationalInsuranceRate = 0.08

        let calculatedTax = annualSalary * taxRate
        let calculatedNationalInsurance = annualSalary * nationalInsuranceRate
        let grossAfterTaxAndNI = annualSalary - calculatedTax - calculatedNationalInsurance

        afterTaxSalary = max(0, grossAfterTaxAndNI)

        taxBreakdown = [
            calculatedTax,
            calculatedNationalInsurance,
            afterTaxSalary
        ].filter { $0 > 0.001 }

        if taxBreakdown.isEmpty {
            taxBreakdown = [1.0]
        }

        let totalComponents = calculatedTax + calculatedNationalInsurance + afterTaxSalary
        if totalComponents > 0 {
            postTaxPercentage = (afterTaxSalary / totalComponents) * 100
            taxPercentage = (calculatedTax / totalComponents) * 100
            nationalInsurancePercentage = (calculatedNationalInsurance / totalComponents) * 100
        } else {
            postTaxPercentage = 0
            taxPercentage = 0
            nationalInsurancePercentage = 0
        }
    }
}

#Preview {
    NavigationView {
        ResultsView(annualSalary: 100000.0)
    }
}
