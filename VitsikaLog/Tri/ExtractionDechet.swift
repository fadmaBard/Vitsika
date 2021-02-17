//
//  ExtractionDechet.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 08/02/2021.
//

import SwiftUI

struct ExtractionDechet: View {
    let couleur : Color
    let image : String
    let text : String
    let dechet: Dechet
    //    @Binding var chosenDechet : Dechet
    @ObservedObject var mesPoints : Points
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        
        NavigationLink(destination: BacDeTri(points: mesPoints, rootIsActive: $rootIsActive, dechet: dechet)) {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(couleur)
                    Image(image)
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .opacity(0.7)
                }
                Text(text)
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .frame(width: 90, height: 130, alignment: .center)
        .padding(20)
        .cornerRadius(20)
        
    }
    
    
    
}

struct ExtractionDechet_Previews: PreviewProvider {
    static var previews: some View {
        ExtractionDechet(couleur: .red, image: "canned-food", text: "", dechet: .ampoule, mesPoints: Points(), rootIsActive: .constant(false))
    }
}
