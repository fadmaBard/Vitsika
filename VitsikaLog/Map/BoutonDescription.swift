//
//  BoutonDescription.swift
//  ModelDonnees
//
//  Created by Elmyre Gargar on 07/02/2021.
//
import MapKit
import SwiftUI

struct BoutonDescription: View {
    @Binding var btn: Bool
    var lieuTri: LieuxTri
    var goAhead = "Je m'y rends"
    
    var body: some View {
        
        
        HStack {
            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
            VStack {
                Text(lieuTri.adress)
                    .font(.subheadline)
                    .foregroundColor(Color("greyVitsika"))
                Text(lieuTri.name)
                    .font(.footnote)
                    .foregroundColor(Color("greyVitsika"))
                Text(lieuTri.type.rawValue)
                    .font(.footnote)
                    .foregroundColor(Color("greyVitsika"))
                
                HStack {
                    Button(action: {
                        btn.toggle()
                    }, label: {
                        Text(goAhead)
                    })
                    .padding(10)
                    .font(.footnote)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                    Button(action: {
                        btn.toggle()
                    }, label: {
                        Text("Annuler")
                    })
                
                    .padding(10)
                    .font(.footnote)
                    .background(Color("greyVitsika"))
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                }
            }
            
        }
        
        .padding()
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(20)
        .frame(width: 400, height: 180, alignment: .bottom)
        
    }
}

struct BoutonDescription_Previews: PreviewProvider {
    static var previews: some View {
        BoutonDescription(btn: .constant(false), lieuTri: LieuxTri(name: "test", geo: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), adress: "test", type: .association))
    }
}


