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
           
            Button
            {} label: {
                Text("Calculate Tax")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
