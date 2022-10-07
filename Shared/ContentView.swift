import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    // herhangi bir değişiklik olduğunda body yi re-invoke eder. 
    // state object'in observed object'ten farkı; -> (state object'in aslinda bu dosya icerisinde hükmü var. diğer sayfaya gecerken burdaki expenses i ordaki observedobject e yolluyoruz)
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            List {
                //ForEach(expenses.items, id: \.id) yerine; diğer taraf Identifiable olduğu için
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    
                }.onDelete(perform: removeItems)
                
            }
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense = true
                      /*
                        let expense = ExpenseItem(name: "s", type: "s", amount: 20)
                        expenses.items.append(expense)
                       */
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                    // diğer sayfaya giderken bizim expenses objemiz ile git
                }
        }
        
        
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
