//
//  ContentView.swift
//  Budgetor
//
//  Created by Michael Pan on 11/14/19Thursday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

import Foundation

extension Date {

    func totalDistance(from date: Date, resultIn component: Calendar.Component) -> Int? {
        return Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }

    func compare(with date: Date, only component: Calendar.Component) -> Int {
        let days1 = Calendar.current.component(component, from: self)
        let days2 = Calendar.current.component(component, from: date)
        return days1 - days2
    }

    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
        return self.compare(with: date, only: component) == 0
    }
    
    func formated(identifier: String = "ja_JP") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: identifier)

        return dateFormatter.string(from: self)
    }
}

struct ContentView: View {
    var viewingDate : Date
    var focusedAccount : Account
    @ObservedObject var budgetsStore : BudgetStore

    init() {
        viewingDate = Date()
//        DataController.DestroyAll()
        DataController.Initial()
        focusedAccount = DataController.accountDatas[0];
        budgetsStore = BudgetStore(budgets: DataController.GetAccountBudget(accountUUID: focusedAccount.id!, date: Date()))
        SetupUI()
    }
    
    func SetupUI() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.15, alpha: 1)
    }

    var body: some View {
        VStack(spacing: 6) {
            HeaderView(self)
            
            List {
                ForEach (budgetsStore.budgets, id: \.objectID) { budget in
                    BudgetRow(budget: budget)
                }
            }.gesture(DragGesture(minimumDistance: 50).onEnded { gesture in
                let distance = gesture.location.x - gesture.startLocation.x
                if abs(distance) > 100 {
                    if distance < 0 {
                        self.budgetsStore.ChangeDate(1)
                    } else {
                        self.budgetsStore.ChangeDate(-1)
                    }
                }
            })
            
            BottomBar(self)
        }.background(Color(red: 0.7, green: 0.2, blue: 0.15))
    }
    
    func AddBudget(account: UUID, amount: Int) {
        budgetsStore.budgets.append(DataController.AddBudget(account: account, amount: amount))
    }
}

//struck Tti

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
