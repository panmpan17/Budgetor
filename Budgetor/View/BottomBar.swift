//
//  BottomBar.swift
//  Budgetor
//
//  Created by Michael Pan on 11/17/19Sunday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct BottomBar: View {
    var mainView : ContentView

    init(_ _mainView : ContentView) {
        mainView = _mainView
    }

    var body: some View {
        HStack(alignment: .bottom) {
            VStack (spacing: 0) {
                HStack (spacing: 0) {
                    Icon(sprite: "add", text: "Add", action: AddNewBudget)
                    Spacer()
                    Icon(sprite: "add", text: "Add", action: {})
                    Spacer()
                    Icon(sprite: "add", text: "Add", action: {})
                }
                
                
                HStack (spacing: 0) {
                    Icon(sprite: "add", text: "Add", action: {})
                    Spacer()
                    Icon(sprite: "add", text: "Add", action: {})
                    Spacer()
                    Icon(sprite: "add", text: "Add", action: {})
                }
            }
        }.background(Color(red: 0.8, green: 0.3, blue: 0.2))
    }
    
    func AddNewBudget() {
        mainView.AddBudget(account: mainView.focusedAccount.id!, amount: 100)
//        mainView.AddBudget(account: mainView.focusedAccount.id!, amount: 100)
    }
}

struct Icon: View {
    var sprite: String
    var text: String
    var action : () -> ()

    var body: some View {
        Button(action: action) {
            VStack (spacing: 3) {
                Image(sprite).resizable().frame(width: 30, height: 30).aspectRatio(contentMode: .fit).foregroundColor(Color.white)
                Text(text).fontWeight(.bold).foregroundColor(Color.white)
            }.frame(width: 80, height: 80)
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
//        BottomBar()
        Text("Test")
    }
}
