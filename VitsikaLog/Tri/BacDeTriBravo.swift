//
//  BacDeTriBravo.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 03/02/2021.
//

import SwiftUI

struct BacDeTriBravo: View {
    
    var destination: AnyView
    
    var body: some View {
        
        NavigationLink(destination: destination) {
            Text ("J'ai pu le déposer")
                .padding(15)
                .padding(.horizontal, 30)
                .background(Color("greyVitsika"))
                .foregroundColor(.white)
                .cornerRadius(30.0)
            
        }
        
    }
    
}
struct BacDeTriBravo_Previews: PreviewProvider {
    static var previews: some View {
        
        BacDeTriBravo(destination: AnyView(Text("hello")))
        
    }
}
