//
//  MonDechet.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 08/02/2021.
//

import SwiftUI

extension Color {
    static let roseVitsika = Color("roseVitsika")
        .opacity(0.4)
    
    static let greyVitsika = Color ("greyVitsika")
}

struct MonDechet: View {
    @ObservedObject var mesPoints : Points
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.fixed(100)),GridItem(.fixed(100)),GridItem(.fixed(100))], content: {
                        ForEach(Dechet.allCases, id: \.self) { myDechet in
                            ExtractionDechet(couleur: .roseVitsika, image: myDechet.rawValue, text: myDechet.rawValue, dechet: myDechet, mesPoints: mesPoints, rootIsActive: $rootIsActive)
                        }
                    })
                }
            }
            
        }
        .navigationBarTitle(Text("Quel est mon déchet ?"), displayMode: .inline)
    }
    
}

struct MonDechet_Previews: PreviewProvider {
    static var previews: some View {
        MonDechet(mesPoints: Points(), rootIsActive: .constant(false))
        
    }
}
