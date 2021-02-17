//
//  ProfilSettings.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 03/02/2021.
//

import SwiftUI

struct ProfilSettings: View {
    
    @ObservedObject var point: Points
    @Binding var fourmistatut: Int
    
    var body: some View {
        ZStack{
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Quelle fourmi se cache en toi ?")
                    .foregroundColor(Color("greyVitsika"))
                    .font(.system(size: 22))
                //                   .padding()
                
                Button(action: {
                    fourmistatut = 1
                }, label: {
                    TypeFourmi(image: "Vitsika1", text: "Fourmi Newbie", textDescription: "J'ai un défi par semaine.")
                })
                .padding(.all, 4)
                
                Button(action: {
                    fourmistatut = 2
                }, label: {
                    TypeFourmi(image: "Vitsika2", text: "Fourmi Boost", textDescription: "J'ai 2 défis par semaine.")
                })
                .padding(.all, 4)
                
                Button(action: {
                    fourmistatut = 3
                }, label: {
                    TypeFourmi(image: "Vitsika3", text: "Fourmi Badass", textDescription: "J'ai autant de défis que possible.")
                })
                .padding(.all, 4)
                
            }
        }
    }
}

struct ProfilSettings_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfilSettings(point: Points(), fourmistatut: .constant(1))
        
        
    }
}


