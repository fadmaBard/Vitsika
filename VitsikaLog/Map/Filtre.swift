//
//  Filtre.swift
//  ModelDonnees
//
//  Created by Elmyre Gargar on 08/02/2021.
//

import SwiftUI

struct Filtre: View {
    @Binding var pickerSelection: Int
    @Binding var currentFilter: TypeLieux?
    var body: some View {
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Filtrer par : ")
                    .foregroundColor(Color("greyVitsika"))
                HStack {
                    
                    Button(action: {
                        currentFilter = TypeLieux.association
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.green)
                            Text("Association")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                    
                    
                    Button(action: {
                        currentFilter = TypeLieux.decheterie
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.red)
                            Text("Déchèterie")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                    
                    
                    
                    Button(action: {
                        currentFilter = TypeLieux.textile
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.yellow)
                            Text("Textile")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                    
                }.padding()
                
                HStack {
                    Button(action: {
                        currentFilter = TypeLieux.bennes
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                            Text("Bennes")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                    
                    Button(action: {
                        currentFilter = TypeLieux.grandeSurface
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.black)
                            Text("Ressourcerie")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                    
                    Button(action: {
                        currentFilter = TypeLieux.autresLieux
                        pickerSelection = 0
                    }, label: {
                        VStack {
                            Image(systemName: "trash.circle").resizable().frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.purple)
                            Text("Autres")}
                            .font(.footnote)
                            .foregroundColor(Color("greyVitsika"))
                    })
                    .frame(width: 90, height: 100)
                    .padding()
                }
                
            }
        }
    }
}

struct Filtre_Previews: PreviewProvider {
    static var previews: some View {
        Filtre(pickerSelection: .constant(0), currentFilter: .constant(nil))
    }
}
