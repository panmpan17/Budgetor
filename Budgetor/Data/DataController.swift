//
//  DataController.swift
//  Budgetor
//
//  Created by Michael Pan on 11/14/19Thursday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

//import Foundation
import SwiftUI
import Foundation
import CoreData

enum BudgetType {
    case Lunch
    case Breakfast
    
    var description : String {
        switch self {
        case .Lunch: return "Lunch"
        case .Breakfast: return "Breakfast"
        }
    }
    
    var icon : String {
        switch self {
        case .Lunch: return "add"
        case .Breakfast: return "settings"
        }
    }
}

class DataController {
    static var accountDatas : [Account] = [];
    static var budget_dict : Dictionary<UUID, [Budget]> = [:]
    static var initialed : Bool = false

    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    static func GetAccountBudget(accountUUID: UUID) -> [Budget] {
        if budget_dict[accountUUID] == nil {
            budget_dict[accountUUID] = []
        }
        return budget_dict[accountUUID]!;
    }
    
    static func Save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                print("Error: \(error), \(error.userInfo)")
            }
        } else {
            print("has no change")
        }
    }

    static func CreateDefaultAccount() {
        let context = persistentContainer.viewContext

        let defaultAccount = Account(context: context)
        defaultAccount.id = UUID()
        defaultAccount.created = Date()
        defaultAccount.name = "Default"
        context.insert(defaultAccount)
        accountDatas.append(defaultAccount)
        print("Created 'Default' account '\(defaultAccount.id!)'")
        Save()
    }

    static func DestroyAll() {
        initialed = false
        let context = persistentContainer.viewContext

        let accountRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        let budgetRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Budget")

        do {
            let accounts = try context.fetch(accountRequest) as! [Account]
            let budgets = try context.fetch(budgetRequest) as! [Budget]

            for account in accounts {
                context.delete(account)
            }
            for budget in budgets {
                context.delete(budget)
            }
            
            try context.save()
        } catch let error {
            print(error)
        }
    }

    static func SetupTestingData() {

    }

    static func Initial() {
        if initialed { return }
        initialed = true
        let context = persistentContainer.viewContext
        
        do {
            let accountRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
            let budgetRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Budget")

            accountDatas = try context.fetch(accountRequest) as! [Account]
            let budgetDatas = try context.fetch(budgetRequest) as! [Budget]
            
//            print(accountDatas)
//            print(budgetDatas)

            if accountDatas.count <= 0 {
                CreateDefaultAccount()
            }

            for budget in budgetDatas {
                if budget_dict[budget.account!] == nil {
                    budget_dict[budget.account!] = []
                }

                budget_dict[budget.account!]!.append(budget)
            
            }
         } catch let error {
             print("My Error \(error), \(error.localizedDescription)")
         }
    }
    
    static func AddBudget(account: UUID, amount: Int) -> Budget {
        let context = persistentContainer.viewContext
        let newBudget = Budget(context: context)
        newBudget.id = UUID()
        newBudget.account = account
        newBudget.amount = Int16(amount)
        newBudget.created = Date()
        
        budget_dict[account]!.append(newBudget)
        context.insert(newBudget)
        Save()
        return newBudget
    }
}
