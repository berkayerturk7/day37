import Foundation



struct ExpenseItem: Identifiable, Codable{
    // userdefaults a alırken id yi let yerine var yaptık
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}


  
