//
//  BacDeTri.swift
//  VitsikaFourmiTrieuse
//
//  Created by Ny Dina on 02/02/2021.

import SwiftUI

struct BacDeTri: View {
    @ObservedObject var points: Points
    
    @Binding var rootIsActive: Bool
    
    @State var dechet : Dechet
    @State var chosenBin : Bin? = nil
    
    var body: some View {
        ZStack{
            Color("roseVitsika")
                .opacity(0.1)
            
            VStack {
                Spacer()
                
                Text("Où dois-je déposer mes \(dechet.rawValue.lowercased())?")
                    .foregroundColor(Color("greyVitsika"))
                    .font(.title3)
                    .bold()
                    .padding()
                
                HStack(spacing: 1) {
                    
                    ExtractionIconBack(couleur: .green, image: "Bouteilles en verre", text: "Verre", borderColor: borderColorVert, action: clicVert )
                    
                    ExtractionIconBack(couleur: .yellow, image: "recycle", text: "PET brique métal", borderColor: borderColorJaune, action: clicJaune )
                    
                    ExtractionIconBack(couleur: .blue, image: "Lightbulb", text: "Point de collecte", borderColor: borderColorBleu, action: clicBleu)
                }.padding(.top, 10)
                
                HStack(spacing: 1) {
                    
                    ExtractionIconBack(couleur: .gray, image: "Waste", text: "Déchêt ménager", borderColor: borderColorGris, action: clicGris )
                    
                    ExtractionIconBack(couleur: .purple, image: "Meubles", text: "Déchèterie", borderColor: borderColorViolet, action: clicViolet )
                    
                    ExtractionIconBack(couleur: .pink, image: "Vêtements", text: "Ressourcerie",  borderColor: borderColorRose, action: clicRose )
                }
                

                
                if chosenBin != nil && !chosenBin!.canAccept(dechet: dechet) {
                    NavigationLink(
                        destination: MapView(),
                        label: {
                            Text("Voir les lieux de tri autour de chez moi")
                                .foregroundColor(Color("roseVitsika"))
                                .padding()
                                .font(.headline)
                        })
                    
                    BacDeTriJeReessaye(chosenBin: $chosenBin)
                }
                
                if chosenBin != nil && chosenBin!.canAccept(dechet: dechet) {
                    NavigationLink(
                        destination: MapView(),
                        label: {
                            Text("Voir les lieux de tri autour de chez moi")
                                .foregroundColor(Color("roseVitsika"))
                                .padding()
                                .font(.headline)
                        })
                    
                    BacDeTriBravo(destination: AnyView(InterfRecompenseView(rootIsActive: $rootIsActive, point: points)))
                }
                
                Spacer()
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    func computeBorder(bin: Bin) -> Color {
        guard let chosenBin = self.chosenBin else { return Color.white.opacity(0.0) }
        guard bin == chosenBin else { return Color.white.opacity(0.0) }
        if bin.canAccept(dechet: dechet) {
            return .green
        } else {
            return .red
        }
    }
    
    func clicBin(bin: Bin) {
        if chosenBin != nil { return }
        chosenBin = bin
        if bin.canAccept(dechet: dechet) {
            points.increment()
        }
    }
    
    // gestion du vert
    
    var borderColorVert: Color {
        return computeBorder(bin: vert)
    }
    
    func clicVert() {
        clicBin(bin: vert)
    }
    
    // gestion du jaune
    
    var borderColorJaune: Color {
        return computeBorder(bin: jaune)
    }
    
    func clicJaune() {
        clicBin(bin: jaune)
    }
    
    // gestion du bleu
    
    var borderColorBleu: Color {
        return computeBorder(bin: bleu)
    }
    
    func clicBleu() {
        clicBin(bin: bleu)
    }
    
    // gestion du gris
    
    var borderColorGris: Color {
        return computeBorder(bin: gris)
    }
    
    func clicGris() {
        clicBin(bin: gris)
    }
    
    // gestion du violet
    
    var borderColorViolet: Color {
        return computeBorder(bin: violet)
    }
    
    func clicViolet() {
        clicBin(bin: violet)
    }
    
    // gestion du rose
    
    var borderColorRose: Color {
        return computeBorder(bin: rose)
    }
    
    func clicRose() {
        clicBin(bin: rose)
    }
    //    fin de la vue
    
}
// fin de BacDeTri

struct BacDeTri_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BacDeTri(points: Points(), rootIsActive: .constant(false), dechet: .ampoule)
        }
    }
}
