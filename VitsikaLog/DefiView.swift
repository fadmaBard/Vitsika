//
//  DefiView.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 09/02/2021.
//

import SwiftUI

struct DefiView: View {
    @State private var triDestination = false
    @State private var defiDestination = false
    @State private var choix = ""
    
    @ObservedObject var point: Points
    
    @State var defiRoot = false
    @State var triRoot = false
    
    func choixVitsika() -> String {
        let chellange = ["Tri", "Défi"]
        return chellange.randomElement()!
    }
    
    var body: some View {
        
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    NavigationLink (
                        destination: MonDechet(mesPoints: Points(), rootIsActive: $triRoot), isActive : $triRoot,
                        label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("roseVitsika"))
                                    .frame(width: 300, height: 350, alignment: .trailing)
                                    .opacity(0.4)
                                    .shadow(radius: 40)
                                VStack {
                                    Text("Tri")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(Color("greyVitsika"))
                                        .padding()
                                        .offset(x: 85)
                                    Text("Recycle un produit.")
                                        .font(.subheadline)
                                        .foregroundColor(Color("greyVitsika"))
                                        //                                      .padding()
                                        .offset(x: 55)
                                }
                            }
                        }
                    )
                    
                    NavigationLink (
                        destination: Challengejour(point: Points(), rootIsActive: $defiRoot), isActive : $defiRoot,
                        label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("roseVitsika"))
                                    .frame(width: 300, height: 350, alignment: .leading)
                                    .opacity(0.4)
                                    .shadow(radius: 40)
                                VStack {
                                    Text("Défi")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(Color("greyVitsika"))
                                        .padding()
                                        .offset(x: -75)
                                    Text("Relève un défi.")
                                        .font(.subheadline)
                                        .foregroundColor(Color("greyVitsika"))
                                        //                                       .padding()
                                        .offset(x: -55)
                                }
                            }
                        }
                    )
                    
                }
                
                
                Text("          Je n'ai pas de préférence \net je laisse Vitsika choisir à ma place.")
                    .foregroundColor(Color("greyVitsika"))
                    .font(.subheadline)
                    .frame(width: 300, height: 50, alignment: .center)
                    .lineSpacing(8)
                
                Button(action: {
                    
                    choix = choixVitsika()
                    if choix == "Défi" {
                        defiDestination = true
                    }
                    else {
                        triDestination = true
                    }
                }, label: {
                    VStack {
                        Image(systemName: "shuffle")
                            .resizable()
                            .frame(width: 100, height: 60, alignment: .center)
                            .foregroundColor(Color("greyVitsika"))
                    }
                    
                })
                
                NavigationLink(
                    destination: MonDechet(mesPoints: Points(), rootIsActive: $triRoot),
                    isActive: $defiDestination,
                    label: {
                        Text("")
                    })
                NavigationLink(
                    destination: Challengejour(point: Points(), rootIsActive: $defiRoot),
                    isActive: $triDestination,
                    label: {
                        Text("")
                    })
            }
        }
        .navigationBarTitle(Text("Fais ton choix !"), displayMode: .inline)
    }
    
}



struct DefiView_Previews: PreviewProvider {
    static var previews: some View {
        DefiView(point: Points())
    }
}

