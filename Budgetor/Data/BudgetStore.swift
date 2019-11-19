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
    // var didChange = PassthroughSubject<Void, Never>()
    let objectWillChange = PassthroughSubject<Void, Never>()

//    var observableList: Observable = Observable([])
    
    var budgets : [Budget] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init(budgets: [Budget] = []) {
        self.budgets = budgets
    }
}
