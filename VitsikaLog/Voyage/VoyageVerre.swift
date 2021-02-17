//
//  VoyageVerre.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 05/02/2021.
//

import SwiftUI

struct VoyageVerre: View {
    let backgroundColor = Color("roseVitsika").opacity(0.3)
    
    @State private var maState: Double = 0
    @State var percentage: CGFloat = 0
    var ImageTriVerre: String {
        if percentage < 20 {
            return "ImagePlate"
        } else if percentage < 40 {
            return "ImageTruck"
        } else if percentage < 60 {
            return "ImageTri"
        } else if percentage < 80 {
            return "ImageOven"
        } else if percentage < 100 {
            return "ImageGlass"
        } else {
            return "ImageBottle"
        }
    }
    
    var textTriVerre: String {
        if percentage == 0 {
            return "Le savais-tu ? \nLa vaisselle « en verre » est une céramique transparente qui ne se recycle pas !"
        } else if percentage == 20 {
            return "Collecte du verre et dépôt dans un centre de traitement."
        } else if percentage == 40 {
            return "Tri manuel et optique du verre récolté pour éliminer matériaux étrangers, ferreux et infusibles."
        } else if percentage == 60 {
            return "Transformation du verre en calcin après un passage au four à 1 500°C pour obtenir une pâte de verre."
        } else if percentage == 80 {
            return "Soufflage de cette pâte de verre dans un moule pour obtenir des récipients puis contrôle qualité."
        } else {
            return "Livraison en usine pour embouteillage. Bravo, ta bouteille est recyclée !"
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image(ImageTriVerre)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140, alignment: .center)
                        .padding(.bottom, 2)
                    ZStack {
                        backgroundColor
                            .frame(height: 170)
                            .edgesIgnoringSafeArea(.vertical)
                            .offset(y: -26)
                        
                        Text(textTriVerre)
                            .fontWeight(.semibold)
                            .colorInvert()
                            .font(.system(size: 22))
                            .frame(width: 330, height: 150, alignment: .center)
                            .padding(.top, 5)
                            .padding(.bottom, 75)
                        
                        Button(action: {
                            self.percentage += CGFloat(20)
                            self.percentage = min(100, self.percentage)
                            self.maState = Double(self.percentage * 360) / 100
                        }, label: {
                            Text("Vitsika recycle")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 50, alignment: .center)
                                .background(Color("roseVitsika"))
                                .cornerRadius(30)
                        })
                        .padding(.top, 150)
                        .padding(.bottom, 40)
                    }
                }
                ZStack {
                    Track()
                    Label(percentage: percentage)
                    Outline(percentage: percentage)
                    
                    Image("VitsikaSoloR")
                        .frame(width: 6, height: 6, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .offset(x: 140, y: 0)
                        //                           .animation(.easeIn)
                        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                        .rotationEffect(.degrees(maState))
                }
                .padding(.top, 10)
            }
        }
    }
}

struct Label: View {
    var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Text(String(format: "%.0f %%", percentage))
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .colorInvert()
        }
    }
}

struct Outline: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color("outlineColor")]
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(Color("roseVitsika"))
                .opacity(0.5)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: [Color("roseVitsika")]), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                )
                .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color("trackColor")]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("backgroundColor"))
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: [Color("colors")]), center: .center))
                )
        }
    }
}


struct VoyageVerre_Previews: PreviewProvider {
    static var previews: some View {
        VoyageVerre()
    }
}
