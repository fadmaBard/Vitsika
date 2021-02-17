//
//  BacDeTriJeReessaye.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 03/02/2021.
//

import SwiftUI

struct BacDeTriJeReessaye: View {
    @State var dechet : Dechet = .canette
    @State var border : Color = .white
    @Binding var chosenBin : Bin?
    
    
    var body: some View {
        Button(action: reessayer ) {
            Text("Je réessaye")
                .padding(15)
                .padding(.horizontal, 50)
                .background(Color("greyVitsika"))
                .foregroundColor(.white)
                .cornerRadius(30.0)
            
        }
        
    }
    func reessayer () {
        chosenBin = nil
        
    }
    
    
    struct BacDeTriJeReessaye_Previews: PreviewProvider {
        static var previews: some View {
            BacDeTriJeReessaye( chosenBin: .constant(vert))
        }
    }
    
    
}
