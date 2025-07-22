//
//  ContentView.swift
//  CalcMyTax
//
//  Created by Rodrigo Cerqueira Reis on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var salary: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Annual Salary")
                TextField("Salary", text: $salary)
                    .frame(width: 200.0, height: 30.0)
                    .keyboardType(.decimalPad)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                NavigationLink(destination: ResultsView(), label: {
                    Text("Calculate Tax")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
    }
}

func goToResultsView() {
    ResultsView()
}

#Preview {
    ContentView()
}
