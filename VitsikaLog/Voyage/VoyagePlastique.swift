//
//  VoyagePlastique.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 05/02/2021.
//

import SwiftUI

struct VoyagePlastique: View {
    let backgroundColor = Color("roseVitsika").opacity(0.3)
    
    @Binding var returnToRoot: Bool
    
    @State private var maState: Double = 0
    @State var percentage: CGFloat = 0
    
    var ImageTriPlastique: String {
        if percentage == 0 {
            return "ImageJumper"
        } else if percentage == 20 {
            return "ImageTruck1"
        } else if percentage == 40 {
            return "ImageRecycle-Bin-White"
        } else if percentage == 60 {
            return "ImageTri"
        } else if percentage == 80 {
            return "Image-Beer-Bottle-White"
        } else {
            return "ImagePlastic"
        }
    }
    
    var textTriPlastique: String {
        if percentage == 0 {
            return "Le savais-tu ? \nAvec 27 bouteilles d’1.5 litres, on fabrique un pull en polaire !"
        } else if percentage == 20 {
            return "Collecte du plastique et mise en balle."
        } else if percentage == 40 {
            return "Affinage par tri optique et séparation des bouchons pour broyage."
        } else if percentage == 60 {
            return "Transformation et regénération en poudre et granules."
        } else if percentage == 80 {
            return "Injection et soufflage de nouvelles bouteilles."
        } else {
            return "Bravo ! Ta bouteille en plastique est recyclée !"
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image(ImageTriPlastique)
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .padding(.top, 20)
                   
                    ZStack {
                        backgroundColor
                            .frame(height: 170)
                            .edgesIgnoringSafeArea(.vertical)
                            .offset(y: -26)
                        
                        Text(textTriPlastique)
                            .fontWeight(.semibold)
                            .colorInvert()
                            .font(.system(size: 22))
                            .frame(width: 330, height: 150, alignment: .center)
  //                          .padding(.top, 5)
                            .padding(.bottom, 55)
                        
                        Button(action: {
                            self.percentage += CGFloat(20)
                            self.percentage = min(100, self.percentage)
                            self.maState = Double(self.percentage * 360) / 100
                        }, label: {
                            Text("En savoir plus")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 280, height: 50, alignment: .center)
                                .background(Color("roseVitsika"))
                                .cornerRadius(30)
                        })
                        .padding(.top, 120)
   //                     .padding(.bottom, 0)
                    }
                }
                ZStack {
                    TrackPlastique()
                    LabelPlastique(percentage: percentage)
                    OutlinePlastique(percentage: percentage)
                    
                    Image("VitsikaSoloR")
                        .resizable()
 //                       .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 80, alignment: .center)
                        .clipped()
                        .offset(x: 120, y: 0)
                        //                           .animation(.easeIn)
                        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                        .rotationEffect(.degrees(maState))
                }
                Spacer()
            }
        }
        .navigationBarTitle(Text("Le voyage du plastique"), displayMode: .inline)
        .navigationBarItems(trailing: Button (action: {
            returnToRoot = false
        }, label: {
            Image(systemName: "xmark")
        }))
        
    }
}

struct LabelPlastique: View {
    var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Text(String(format: "%.0f %%", percentage))
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .colorInvert()
        }
    }
}

struct OutlinePlastique: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color("outlineColor")]
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 160, height: 160)
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

struct TrackPlastique: View {
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

struct VoyagePlastique_Previews: PreviewProvider {
    static var previews: some View {
        VoyagePlastique(returnToRoot: .constant(false))
    }
}
