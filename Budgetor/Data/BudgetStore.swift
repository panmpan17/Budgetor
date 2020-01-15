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
    
    var view : String {
        willSet {
            objectWillChange.send()
        }
    }
    var viewDate : Date {
        willSet {
            objectWillChange.send()
        }
    }
    var focusedAccount : Account
    var budgets : [Budget] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        viewDate = Date()
        focusedAccount = DataController.accountDatas[0];
        budgets = DataController.GetAccountBudget(accountUUID: focusedAccount.id!, date: viewDate)
        view = "main"
    }
    init(isNone: Bool) {
        viewDate = Date()
        focusedAccount = Account()
        budgets = []
        view = "main"
    }
    
    func ChangeDate(_ newDate: Date) {
        viewDate = newDate
        budgets = DataController.GetAccountBudget(accountUUID: focusedAccount.id!, date: viewDate)
    }
    
    public func ChangeDate(_ amount: Int) {
        viewDate = Calendar.current.date(byAdding: .day, value: amount, to: viewDate)!
        budgets = DataController.GetAccountBudget(accountUUID: focusedAccount.id!, date: viewDate)
    }
}
