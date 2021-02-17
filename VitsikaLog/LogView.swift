//
//  ContentView.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 03/02/2021.
//

import SwiftUI

struct LogView: View {
    @State var user: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @Binding var hideLoggin: Bool
    @State var hidde = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 0) {
                TitreVitsika()
                ZStack {
                    CercleRose()
                    VStack (spacing: 10){
                        Text ("Connexion")
                            .foregroundColor(Color("greyVitsika"))
                            .font(.system(size: 28))
                            .padding(.top, 20)
                        
                        UsernameTextfield(user: $user)
                            .padding(.top, 15)
                        
                        Passwordfield(password: $password)
                        
                        Button(action: {
                            hideLoggin.toggle()
                        }, label: {
                            LoginButtonContent()
                        })
                    }
                }
                .padding(.bottom, 60)
                
                HStack(spacing: 0) {
                    Text ("Vous n'avez pas de compte ? ")
                        .font(.caption2)
                        .foregroundColor(Color("greyVitsika"))
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text(" Je m'inscris.")
                            .font(.caption2)
                            .foregroundColor(Color("greyVitsika"))
                    })
                }
                .frame(width: 250, height: 20, alignment: .center)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        LogView(hideLoggin: .constant(false))
    }
}

