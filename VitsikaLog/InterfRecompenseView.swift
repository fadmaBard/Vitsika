//
//  InterfRecompenseView.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 09/02/2021.
//

import SwiftUI

struct InterfRecompenseView: View {
    
    @Binding var rootIsActive: Bool
    
    @State private var voyageDestination = false
    @State private var cameraDestination = false
    @ObservedObject var point: Points
    
    var body: some View {
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color("greyVitsika"))
                    
                    Text("\(point.count) points")
                        .foregroundColor(Color("greyVitsika"))
                        .font(.headline)
                }
                
                Button(action: {cameraDestination=true}, label: {
                    Text("Je partage mon défi")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 230, height: 45, alignment: .center)
                        .background(Color("greyVitsika"))
                        .cornerRadius(30)
                        .shadow(radius: 40)
                        .padding()
                })
                
                Button(action: {voyageDestination=true}, label: {
                    Text("Voir le trajet de mes déchets")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color((.white)))
                        .frame(width: 230, height: 45, alignment: .center)
                        .background(Color("roseVitsika"))
                        .shadow(radius: 40)
                        .cornerRadius(30)
                })
                
                Text("Regarde ce que fait la colonie")
                    .foregroundColor(Color("greyVitsika"))
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 60)
                
                HStack {
                    //  List(pictures){ picture in
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(pictures) { picture in PictureRow(picture: picture) }
                        }} }
                    .padding()
                
                NavigationLink(
                    destination: VoyagePlastique(returnToRoot: $rootIsActive), // à remplacer avec le lien
                    isActive: $voyageDestination,
                    label: {
                        Text(" ")
                    })
                NavigationLink(
                    destination: CameraView(), // à remplacer avec le lien
                    isActive: $cameraDestination,
                    label: {
                        Text(" ")
                    })
            }
            .navigationBarTitle(Text("Mes points"), displayMode: .inline)
        }
    }
    
    struct InterfRecompenseView_Previews: PreviewProvider {
        static var previews: some View {
            InterfRecompenseView(rootIsActive: .constant(false), point: Points())
        }
    }
}

struct PictureRow: View {
    let picture: Picture
    var body: some View {
        
        VStack {
            Image(picture.imgName)
                .resizable()
                .frame(width: 90, height: 90)
                .clipped()
                .aspectRatio(contentMode: .fill)
            
            Text(picture.name)
                .font(.subheadline)
                .foregroundColor(Color("greyVitsika"))
            
        }
    }
}

