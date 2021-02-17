//
//  VoyagePile.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 05/02/2021.
//

import SwiftUI

struct VoyagePile: View {
    let backgroundColor = Color("roseVitsika").opacity(0.3)
    
    @State private var maState: Double = 0
    @State var percentage: CGFloat = 0
    var ImageTriPile: String {
        if percentage == 0 {
            return "ImageLighting"
        } else if percentage == 20 {
            return "ImageTruck1"
        } else if percentage == 40 {
            return "ImageBroyage"
        } else if percentage == 60 {
            return "ImageFolder"
        } else if percentage == 80 {
            return "ImageBatteries"
        } else {
            return "ImageEcosystem"
        }
    }
    
    var textTriPile: String {
        if percentage == 0 {
            return "Le savais-tu ? \n+7 000 ans, c'est la durée du processus de dégradation d’une pile dans la nature."
        } else if percentage == 20 {
            return "Collecte de la pile et traitement par pyrolise ou pyrométallurgie."
        } else if percentage == 40 {
            return "Broyage puis séparation des matériaux."
        } else if percentage == 60 {
            return "Valorisation en matière première (plomb, cadmium, zinc, manganèse, acier)."
        } else if percentage == 80 {
            return "Approvissionnement des filières en matière première recyclée pour fabrication de nouveaux produits(piles, carrosseries, peinture anti-rouille)."
        } else {
            return "Bravo ! Ta pile est recyclée !"
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image(ImageTriPile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140, alignment: .center)
                        .padding(.bottom, 2)
                    ZStack {
                        backgroundColor
                            .frame(height: 170)
                            .edgesIgnoringSafeArea(.vertical)
                            .offset(y: -26)
                        
                        Text(textTriPile)
                            .fontWeight(.semibold)
                            .colorInvert()
                            .font(.system(size: 20))
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
                    TrackPile()
                    LabelPile(percentage: percentage)
                    OutlinePile(percentage: percentage)
                    
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

struct LabelPile: View {
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

struct OutlinePile: View {
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

struct TrackPile: View {
    var colors: [Color] = [Color("trackColor")]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("backgroundColor"))
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: [Color("colors")]), center: .center))
                )
        }
    }
}


struct VoyagePile_Previews: PreviewProvider {
    static var previews: some View {
        VoyagePile()
    }
}
