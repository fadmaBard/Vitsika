//
//  MonCompte.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 03/02/2021.
//

import SwiftUI

struct MonCompte: View {
    @State var geolocalisation = false
    @State var frequence = 1
    @State var fourmistatut = 1
    @State var email: String = ""
    @State var pseudo: String = ""
    @State var password: String = ""
    
    @ObservedObject var points: Points
    
    
    var body: some View {
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ZStack {
                    Image("Vitsika\(fourmistatut)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipped()
                        .shadow(radius: 0.8)
                        .padding()
                }
                VStack {
                    Form {
                        Section(header: Text("Mes identifiants")){
                            Text("Kinga99")
                            Text("kinga.vitsika@icloud.com")
                        }
                        
                        Section(header: Text("Paramètres Vitsika")) {
                            NavigationLink(
                                destination: ProfilSettings(point: points, fourmistatut: $fourmistatut),
                                label: {
                                    Text("Statut")
                                })
                            
                            HStack {
                                Text("Points")
                                Spacer()
                                Text("37")}
                            
                            
                            Toggle(isOn: $geolocalisation) {
                                Text("Géolocalisation")}
                            
                            Stepper(value: $frequence, in: 1...20) {
                                Text("\(frequence) notification\(frequence > 1 ? "s" : "") / semaine")} }
                        
                        Section(header: Text("Mes défis")){
                            ScrollAlbum()}
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text("Mon profil"), displayMode: .inline)
            .navigationBarItems(trailing: Text("Editer")
        
            )
        }
    }
}

struct MonCompte_Previews: PreviewProvider {
    static var previews: some View {
        MonCompte(points: Points())
    }
}
