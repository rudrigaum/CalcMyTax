//
//  ContentView.swift
//  CalcMyTax
//
//  Created by Rodrigo Cerqueira Reis on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var salary: String = ""
    @State private var isSalaryValid: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Annual Salary")
                TextField("Salary", text: $salary)
                    .frame(width: 200.0, height: 30.0)
                    .keyboardType(.decimalPad)
                    .padding(5)
                    .keyboardType(.decimalPad)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                }
                
                NavigationLink(destination: ResultsView(), isActive: $isSalaryValid, label: {
                    Text("Calculate Tax")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            validateAndNavigateToResults()
                        }
                })
            }
            .padding()
        }
    }
    
    func validateAndNavigateToResults() {
        errorMessage = ""
        isSalaryValid = false
        
        guard let salaryFloat = Float(salary) else {
            errorMessage = "Please enter a valid salary."
            return
        }
        
        if salaryFloat > 0 {
            isSalaryValid = true
        } else {
            errorMessage = "Salary must be greater than zero."
        }
    }
}



#Preview {
    ContentView()
}
