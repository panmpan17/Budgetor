//
//  ContentView.swift
//  Budgetor
//
//  Created by Michael Pan on 11/14/19Thursday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.15, alpha: 1)
        
        DataController.Initial()
//        View.appea
    }

    var body: some View {
        VStack(spacing: 6) {
            HeaderView(viewingDate: Date(), account: AccountStruct(name: "Card"))
            
            List {
                ForEach (DataController.GetAllBudget(), id: \.id) { budget in
                    BudgetRow(budget: budget)
                }
            }
            
            BottomBar()
        }.background(Color(red: 0.7, green: 0.2, blue: 0.15))
    }
}

//struck Tti

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
