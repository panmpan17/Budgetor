//
//  ContentView.swift
//  Budgetor
//
//  Created by Michael Pan on 11/14/19Thursday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewingDate : Date
    var focusedAccount : Account
    @ObservedObject var budgetsStore : BudgetStore

    init() {
        viewingDate = Date()
//        DataController.DestroyAll()
        DataController.Initial()
        focusedAccount = DataController.accountDatas[0];
        budgetsStore = BudgetStore(budgets: DataController.GetAccountBudget(accountUUID: focusedAccount.id!))
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
                ForEach (budgetsStore.budgets, id: \.id) { budget in
                    BudgetRow(budget: budget)
                }
            } //.onAppear {
//                self.budgets = DataController.GetAccountBudget(accountUUID: self.focusedAccount.id!)
//            }
            
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
