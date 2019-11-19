//
//  BudgetStore.swift
//  Budgetor
//
//  Created by Michael Pan on 11/19/19Tuesday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class BudgetStore : ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var viewDate : Date
    var budgets : [Budget] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init(budgets: [Budget] = []) {
        self.viewDate = Date()
        self.budgets = budgets
    }
    
    func ChangeDate(_ newDate: Date) {
        viewDate = newDate
        budgets = DataController.GetAccountBudget(accountUUID: DataController.accountDatas[0].id!, date: viewDate)
    }
    
    public func ChangeDate(_ amount: Int) {
        viewDate = Calendar.current.date(byAdding: .day, value: amount, to: viewDate)!
        budgets = DataController.GetAccountBudget(accountUUID: DataController.accountDatas[0].id!, date: viewDate)
    }
}
