//
//  Map Liste.swift
//  ModelDonnees
//
//  Created by Elmyre Gargar on 05/02/2021.
//
import MapKit
import SwiftUI

struct Map_Liste: View {
    
    @State private var lieuxCollecte: [LieuxTri] = LieuxTri.getLieuxTri()
    @State var showModal = false
    var goAhead = "Je m'y rends"
    var cancel = "Annuler"
    
    var body: some View {
        
        VStack {
            
            ForEach(lieuxCollecte, id: \.id){
                location in
                VStack{
                    Text(location.type.rawValue)
                    Text(location.name)
                    Text(location.adress)
                    
                    HStack {
                        Button(action: {}, label: {
                            Text(goAhead)
                        })
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        
                        
                        Button(action: {}, label: {
                            Text(cancel)
                        })
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                    }
                }.padding()
            }
        }
        
    }
}


struct Map_Liste_Previews: PreviewProvider {
    static var previews: some View {
        Map_Liste()
    
    }
}
