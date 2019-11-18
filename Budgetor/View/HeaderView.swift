//
//  HeaderView.swift
//  Budgetor
//
//  Created by Michael Pan on 11/15/19Friday.
//  Copyright © 2019 Michael Pan. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var viewingDate : Date
    var account : AccountStruct
    
    var FormatedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ja_JP")
        
        return dateFormatter.string(from: viewingDate)
    }
    
    var body: some View {
        HStack (alignment: .top) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(FormatedDate).font(.title).foregroundColor(Color.white)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(account.name).font(.title).foregroundColor(Color.white)
            }
        }.padding().background(Color(red: 0.8, green: 0.3, blue: 0.2))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewingDate: Date(), account: AccountStruct(name: "Card"))
    }
}
