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

struct BudgetStruct : Identifiable {
    var id = UUID()
    var type : BudgetType
    var amount : Int
}

struct AccountStruct {
    var name : String
}


class DataController {
    static func GetAllBudget() -> [BudgetStruct] {
        let list = [
            BudgetStruct(type: BudgetType.Breakfast, amount: 45),
        ]
        
        return list;
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Easy_Record")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func Initial() {
        let context = persistentContainer.viewContext
        
        do {
            print(1)
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
            
            //request.sortDescriptors = [NSSortDescriptor(key: "created", ascending: false)]
            
            let accounts = try context.fetch(request) as! [Account]
            print(accounts.count)
        } catch let error {
            print("My Error \(error), \(error.localizedDescription)")
            
//            let defaultAccount = Account(context: context)
//            defaultAccount.id = UUID()
//            defaultAccount.created = Date()
//            defaultAccount.name = "Default"
//            context.insert(defaultAccount)
//            print("inserted")
            let accountEntity = NSEntityDescription.entity(forEntityName: "Account", in: context)!
            
            let defaultAccount = NSManagedObject(entity: accountEntity, insertInto: context)
            defaultAccount.setValue(UUID(), forKey: "id")
            defaultAccount.setValue(Date(), forKey: "created")
            defaultAccount.setValue("Default", forKey: "name")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
