import SwiftUI

struct HeaderView: View {
    var focusedAccount : Account
    var mainView : ContentView

    init(_ parentView: ContentView) {
        focusedAccount = parentView.focusedAccount
        mainView = parentView
    }
    
    var body: some View {
        HStack (alignment: .top) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(mainView.budgetsStore.viewDate.formated()).font(.title).foregroundColor(Color.white)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(focusedAccount.name!).font(.title).foregroundColor(Color.white)
            }
        }.padding().background(Color(red: 0.8, green: 0.3, blue: 0.2))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Needed ContentView")
    }
}
