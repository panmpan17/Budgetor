//
//  AddBudgetView.swift
//  Budgetor
//
//  Created by Michael Pan on 11/20/19Wednesday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct AddBudgetView : View {
    @State private var amount: String = "0"
//    var amount : String = "0"

    var body : some View {
        VStack {
//            if amount.searc
            TextField("Amount", text: $amount, onEditingChanged: AmountEditChange).font(.largeTitle).multilineTextAlignment(.trailing).padding().background(Color(red: 0.5, green: 0.5, blue: 0.2)).keyboardType(.decimalPad)
            
            NumberPad()
        }
    }
    
    func AmountEditChange(changed: Bool) {
        print(changed)
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView().background(Color(red: 0.7, green: 0.2, blue: 0.15))
    }
}

struct NumberButton: View {
    var text : String
    var width : CGFloat
    var height : CGFloat
    
    init(_ text: String, _ width: CGFloat) {
        self.text = text
        self.width = width
        self.height = width
    }
    init(_ text: String, _ width: CGFloat, _ height: CGFloat) {
        self.text = text
        self.width = width
        self.height = height
    }
    
    var body : some View {
        Text(text).frame(width: width, height: height)
    }
}

struct NumberPad: View {
    var body: some View {
//        HStack(alignment: .bottom) {
            GeometryReader () { geometry in
                VStack (spacing: 0)  {
                    HStack (spacing: 0)  {
                        NumberButton("+", geometry.size.width / 4)
                        NumberButton("-", geometry.size.width / 4)
                        NumberButton("X", geometry.size.width / 4)
                        NumberButton("%", geometry.size.width / 4)
                    }
                    HStack (spacing: 0)  {
                        VStack (spacing: 0) {
                            HStack(spacing: 0) {
                                NumberButton("1", geometry.size.width / 4)
                                NumberButton("2", geometry.size.width / 4)
                                NumberButton("3", geometry.size.width / 4)
                            }
                            HStack(spacing: 0) {
                                NumberButton("4", geometry.size.width / 4)
                                NumberButton("5", geometry.size.width / 4)
                                NumberButton("6", geometry.size.width / 4)
                            }
                            HStack(spacing: 0) {
                                NumberButton("7", geometry.size.width / 4)
                                NumberButton("8", geometry.size.width / 4)
                                NumberButton("9", geometry.size.width / 4)
                            }
                            HStack(spacing: 0) {
                                NumberButton(".", geometry.size.width / 4)
                                NumberButton("0", geometry.size.width / 4)
                                NumberButton("<", geometry.size.width / 4)
                            }
                        }
                        
                        VStack (spacing: 0)  {
                            NumberButton("AC", geometry.size.width / 4, geometry.size.width / 2)
                            NumberButton("OK", geometry.size.width / 4, geometry.size.width / 2)
                        }
                    }
                }
            }.frame(alignment: .bottom)

        // }
    }
}
