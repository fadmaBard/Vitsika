//
//  ExtractionIconBack.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 03/02/2021.
//

import SwiftUI

struct ExtractionIconBack: View {
    let couleur : Color
    let image : String
    let text : String
    let borderColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
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
                    .foregroundColor(Color("greyVitsika"))
                Spacer()
            }
        })
        .frame(width: 80, height: 130, alignment: .center)
        .padding(20)
        .border(borderColor, width: 5)
        .cornerRadius(20)
        
        
        
        
    }
    
    
    
}

struct ExtractionIconBack_Previews: PreviewProvider {
    static var previews: some View {
        ExtractionIconBack( couleur :  .green,
                            image :  "wine",
                            text : "Verre",
                            borderColor: .red,
                            action:  {})
    }
}

