//
//  Signup.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 03/02/2021.
//

import SwiftUI

struct Signup: View {
    @State var user: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var hidde = false
    @Binding var fourmistatut: Int
    @ObservedObject var point: Points
    
    var body: some View {
        
        VStack(spacing: 0) {
            TitreVitsika()
                .padding()
            ZStack {
                CercleRose()
                VStack (spacing: 5){
                    Text ("Inscription")
                        .foregroundColor(Color("greyVitsika"))
                        .font(.system(size: 28))
                        .padding(.top, 4)
                    
                    UsernameTextfield(user: $user)
                        .padding(.top, 10)
                    EmailTextfield(email: $email)
                    
                    Passwordfield(password: $password)
                    
                    NavigationLink (
                        destination: ProfilSettings(point: point, fourmistatut: $fourmistatut),
                        label: {
                            LoginButtonContent()
                        })
                    
                    //                    Button(action: {
                    //                    }, label: {
                    //                    LoginButtonContent()
                    //                    })
                }
            }
            .padding(.bottom, 60)
            ConditionsGeneralesText()
            HStack(spacing: 0) {
                Text ("Vous avez déjà un compte ? ")
                    .font(.caption2)
                    .foregroundColor(Color("greyVitsika"))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text(" Connectez-vous.")
                        .font(.caption2)
                        .foregroundColor(Color("greyVitsika"))
                })
            }
            .frame(width: 250, height: 20, alignment: .center)
            
        }
        .padding(.top, 60)
        .padding(.bottom, 60)
        
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup(fourmistatut: .constant(1), point: Points())
    }
}




