// Struct, array gibi yapıları UserDefaults'a kaydetmeyi böyle yaparız.


import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}


struct LearnCodable: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        
        
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
        
    }
}

struct LearnCodable_Previews: PreviewProvider {
    static var previews: some View {
        LearnCodable()
    }
}
