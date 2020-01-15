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
    
    init() {
        DataController.Initial()
        budget = Budget(context: DataController.persistentContainer.viewContext)
        budget.id = UUID()
        budget.account = DataController.accountDatas[0].id!
        budget.amount = 100
        budget.created = Date()
    }
    init(budget: Budget) {
        self.budget = budget
    }
    
    func FormatedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ja_JP")
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            Button (action: {}) {
                HStack {
                    Image("add").resizable().frame(maxWidth: 15, maxHeight: 15).aspectRatio(contentMode: .fit).foregroundColor(Color.white)
                    Text("Lunch")
                        .font(.headline).foregroundColor(Color.white)
                    Spacer()
                    Text("$ \(budget.amount)").font(.subheadline).foregroundColor(Color.white)
                }
            }.padding(5)
        }.background(Color(red: 0.8, green: 0.3, blue: 0.2)).cornerRadius(8).padding(.horizontal, 5).listRowBackground(Color(red: 0.7, green: 0.2, blue: 0.15))
    }
}

struct BudgetRow_Previews: PreviewProvider {
    static var previews: some View {
        BudgetRow()
    }
}
