//
//  ExtractVitsika.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 04/02/2021.
//

import SwiftUI

struct TitreVitsika: View {
    
    var body: some View {
        Text("Vitsika")
            .font(.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(Color("roseVitsika"))
            .frame(width: 250, height: 100, alignment: .center)
    }
}

struct CercleRose: View {
    
    var body: some View  {
        Circle()
            .foregroundColor(Color("roseVitsika"))
            .opacity(0.25)
            .aspectRatio(contentMode: .fill)
            .frame(width: 370, height: 370, alignment: .center)
    }
}

struct UsernameTextfield: View {
    @Binding var user: String
    
    var body: some View {
        TextField("Pseudo", text: $user)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(5.0)
            .frame(width: 320, height: 60, alignment: .center)
            .opacity(0.9)
    }
}


struct EmailTextfield: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Email", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(5.0)
            .frame(width: 320, height: 60, alignment: .center)
            .opacity(0.9)
    }
}


struct Passwordhidded: View {
    @Binding var password: String
    
    var body: some View {
        TextField("Mot de passe", text: $password)
            .cornerRadius(5.0)
            .frame(width: 320, height: 60, alignment: .center)
            .opacity(0.9)
    }
}

struct Passwordfilled: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Mot de passe", text: self.$password)
            .cornerRadius(5.0)
            .frame(width: 320, height: 60, alignment: .center)
            .opacity(0.9)
    }
}


struct Passwordfield: View {
    @Binding var password: String
    @State var hidde = false
    
    var body: some View {
        ZStack {
            HStack {
                if self.hidde {
                    Passwordhidded(password: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: 15, y: 0)
                } else {
                    Passwordfilled(password: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: 15, y: 0)
                }
                Button(action: {
                    self.hidde.toggle()
                }, label: {
                    Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor((self.hidde == true) ? Color.blue : Color.secondary)
                })
                .offset(x: -25, y: 0)
            }
        }
    }
}

struct Passwordfield2: View {
    @Binding var password: String
    @State var hidde = false
    
    var body: some View {
        ZStack {
            HStack {
                if self.hidde {
                    Passwordhidded(password: $password)
                } else {
                    Passwordfilled(password: $password)
                }
                Button(action: {
                    self.hidde.toggle()
                }, label: {
                    Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor((self.hidde == true) ? Color.blue : Color.secondary)
                        .offset(x: -55, y: 0)
                })
            }
        }
    }
}


struct LoginButtonContent: View {
    var body: some View {
        Text("Je valide")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 230, height: 45, alignment: .center)
            .background(Color("greyVitsika"))
            .cornerRadius(30)
    }
}


struct ConditionsGeneralesText: View {
    var body: some View {
        Text ("En créant votre compte, vous acceptez nos conditions générales.")
            .frame(width: 250, height: 40, alignment: .center)
            .font(.caption2)
            .foregroundColor(Color("greyVitsika"))
    }
    
}

struct TypeFourmi: View {
    var image: String = ""
    var text: String = ""
    var textDescription: String = ""
    
    var body: some View {
        
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110, alignment: .center)
                .clipped()
            VStack {
                Text(text)
                    .foregroundColor(Color("greyVitsika"))
                    .font(.headline)
                    .font(.system(size: 16))
                    .padding()
                    .font(.headline)
                Text(textDescription)
                    .foregroundColor(Color("greyVitsika"))
                    .font(.subheadline)
                    .font(.system(size: 16))
            }
        }
        
        .frame(width: 300, height: 160, alignment: .center)
        .background(Color("roseVitsika").opacity(0.3))
        .cornerRadius(30)
        
    }
}


struct ScrollAlbum: View {
    
    private var HistoriqueImage: [String] =
        [
            "HistoriqueImage1",
            "HistoriqueImage2",
            "HistoriqueImage3",
            "HistoriqueImage4",
            "HistoriqueImage5",
            "HistoriqueImage6",
            "HistoriqueImage7",
            "HistoriqueImage8",
            "HistoriqueImage9",
            "HistoriqueImage10"
        ]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(HistoriqueImage, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipped()
                }
            }
        }
    }
}





