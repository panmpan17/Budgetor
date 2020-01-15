import SwiftUI

struct HeaderView: View {
    @ObservedObject var budgetStore : BudgetStore

    init() {
        budgetStore = BudgetStore(isNone: true)
    }
    init(_ store: BudgetStore) {
        budgetStore = store
    }
    
    var body: some View {
        HStack (alignment: .top) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(budgetStore.viewDate.formated()).font(.title).foregroundColor(Color.white)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(budgetStore.focusedAccount.name!).font(.title).foregroundColor(Color.white)
            }
        }.padding().background(Color(red: 0.8, green: 0.3, blue: 0.2))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
