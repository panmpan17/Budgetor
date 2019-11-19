//
//  BudgetRow.swift
//  Budgetor
//
//  Created by Michael Pan on 11/14/19Thursday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct BudgetRow: View {
    var budget : Budget
    
    var body: some View {
        HStack {
            Button (action: {}) {
                HStack {
                    Image("add").resizable().frame(maxWidth: 15, maxHeight: 15).aspectRatio(contentMode: .fit).foregroundColor(Color.white)
                    Text("Lunch")
                        .font(.headline).foregroundColor(Color.white)
                    Spacer()
                    Text("$ " + String(budget.amount)).font(.subheadline).foregroundColor(Color.white)
                }
            }.padding(5)
        }.background(Color(red: 0.8, green: 0.3, blue: 0.2)).cornerRadius(8).padding(.horizontal, 5).listRowBackground(Color(red: 0.7, green: 0.2, blue: 0.15))
    }
}

struct BudgetRow_Previews: PreviewProvider {
    static var previews: some View {
//        BudgetRow(budget: BudgetStruct.New(account: UUID(), type: BudgetType.Lunch, amount: 100))
        Text("Test")
    }
}
