import Foundation

class Expenses : ObservableObject {
    
    @Published var items: [ExpenseItem] = [ExpenseItem]() {
    
    // UserDefaults kısmını yapıyoruz. items'da bir şey değiştiğinde yakalamak için didSet kullanacağız.
    
        // UserDefaults'a kaydet
        didSet {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // Uygulama yeniden açılırken vs. otomatik yükleme
    init() {
            if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // [ExpenseItem].self -> ExpenseItem tipinde olan ilgili obje
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        // if let'in else'i ; yani böyle bir şey bulunmazsa
        items = []
        
    }
    
    
}

/*
struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
*/


//var a0 = ExpenseItem(name: "x harcaması", type: "y tipi", amount: "z miktarı")
//var a1 = ExpenseItem(name: "x harcaması", type: "y tipi", amount: "z miktarı")
//var a2 = ExpenseItem(name: "x harcaması", type: "y tipi", amount: "z miktarı")

// expenses objemiz
// items = [a0, a1, a2]
