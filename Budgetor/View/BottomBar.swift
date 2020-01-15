//
//  BottomBar.swift
//  Budgetor
//
//  Created by Michael Pan on 11/17/19Sunday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct BottomBar: View {
    @ObservedObject var budgetStore: BudgetStore
    
    init() {
        budgetStore = BudgetStore(isNone: true)
    }
    init(_ store: BudgetStore) {
        budgetStore = store
    }
    
    var body: some View {
//        NavigationView {
//            List{
            HStack() {
                VStack (spacing: 0) {
                    HStack (spacing: 0) {
                        Button(action: {
                            self.budgetStore.view = "addbudget"
                        }) {
                            Icon(sprite: "add", text: "Add")
                        }
                        Spacer()
                        Icon(sprite: "add", text: "Add")
                        Spacer()
                        Icon(sprite: "add", text: "Add")
                    }
                    
                    
                    HStack (spacing: 0) {
                        Icon(sprite: "add", text: "Add")
                        Spacer()
                        Icon(sprite: "add", text: "Add")
                        Spacer()
                        Icon(sprite: "add", text: "Add")
                    }
                }
            }.background(Color(red: 0.8, green: 0.3, blue: 0.2))
//        }
//        }
    }
    
    func AddNewBudget() {
//        mainView.AddBudget(account: mainView.budgetsStore.focusedAccount.id!, amount: 100)
    }
}

struct Icon: View {
    var sprite: String
    var text: String

    var body: some View {
//        Button(action: action) {
            VStack (spacing: 3) {
                if sprite != "" {
                    Image(sprite).resizable().frame(width: 30, height: 30).aspectRatio(contentMode: .fit).foregroundColor(Color.white)
                }
                Text(text).fontWeight(.bold).foregroundColor(Color.white)
            }.frame(width: 80, height: 80)
//        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            BottomBar()
//        }
//        Text("Test")
    }
}
