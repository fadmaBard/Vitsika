//
//  ModelVitsika.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 04/02/2021.
//
import Foundation
import SwiftUI
import MapKit

struct Picture: Identifiable{
    var id = UUID()
    var name: String
    var imgName : String
    var dateImg : String
    
}

let pictures = [
    
    Picture(name: "Vitsika 60", imgName: "img1", dateImg: "05/02/2021"),
    Picture(name: "Vitsika 93", imgName: "img2", dateImg: "12/01/2021"),
    Picture(name: "Vitsika 75", imgName: "img3", dateImg: "17/01/2021"),
    Picture(name: "Vitsika 75", imgName: "img4", dateImg: "03/01/2021"),
    Picture(name: "Vitsika 75", imgName: "img5", dateImg: "02/01/2021"),
    
]



//struct User: Identifiable {
//    var id = UUID()
//    var username: String
//    var status: Status
//    var image: String
//    var email: String
//    var password: String
//    var points: Int
//}
//
//enum Status {
//    case decouverte, connaisseur, expert
//}


struct Bin: Equatable {
    var dechets : [Dechet]
    func canAccept (dechet: Dechet) -> Bool {
        return dechets.contains(dechet)
    }
}

enum Dechet : String, CaseIterable {
    
    case déchetAlimentaire = "Epluchures"
    case brique = "Briques"
    case jouets = "Jouets"
    case canette = "Canettes"
    case plastique = "Plastiques"
    case lingeDeMaison = "Linges de maison"
    case papier = "Papiers"
    case encombrant = "Encombrants"
    case maroquinerie = "Maroquineries"
    case bocalEnVerre = "Bocaux en verre"
    case appareilElectrique = "Petits appareils éléctriques"
    case ampoule = "Ampoules"
    case débris = "Débris et bois"
    case filmPlastique = "Films plastiques"
    case cartonDeDéménagement = "Gros cartons"
    case meuble = "Meubles"
    case électroménager = "Appareils électroménagers"
    case bouteilleEnVerre = "Bouteilles en verre"
    case vetement = "Vêtements"
    case peluche = "Peluches"
    case fils = "Fils électriques"
    case cartoucheDEncre = "Cartouches d'encre vides"
    case verre = "Verres"
    case matelas = "Matelas"
    
    
}

var vert = Bin(dechets: [.bouteilleEnVerre, .bocalEnVerre])
var bleu = Bin(dechets: [.ampoule, .fils, .appareilElectrique, .cartoucheDEncre])
var jaune = Bin(dechets: [.canette, .plastique, .brique, .papier])
var gris = Bin(dechets: [.déchetAlimentaire, .filmPlastique])
var violet = Bin(dechets: [.débris, .cartonDeDéménagement, .meuble, .électroménager, .matelas, .encombrant])
var rose = Bin(dechets: [.vetement, .maroquinerie, .lingeDeMaison, .jouets, .peluche])



class Points: ObservableObject {
    
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
    
}


struct Challenge: Identifiable {
    var id = UUID()
    var description: String
    var points: Int
    var selection: Bool
    var validation: Bool
}


var choixChallenge = [
    Challenge(description: "Faire tes propres produits ménagers.", points: 6, selection: false, validation: false),
    Challenge(description: "Trier tes mails et ne garder que les plus importants.", points: 1, selection: false, validation: false),
    Challenge(description: "Remplacer tes éponges par des éponges en tissu et tes cotons par des cotons en tissu.", points: 3, selection: false, validation: false),
    Challenge(description: "Fabriquer un petit composteur pour tes épluchures et autres déchets organiques.", points: 4, selection: false, validation: false),
    Challenge(description: "Apporter des couverts non-jetables si tu manges dehors ou à l’école le midi.", points: 1, selection: false, validation: false),
    Challenge(description: "Faire tes propres produits cosmétiques.", points: 4, selection: false, validation: false),
    Challenge(description: "Apposer un autocollant « Stop-Pub » sur sa boite aux lettres.", points: 1, selection: false, validation: false),
    Challenge(description: "Défi consommation d’eau : acheter une carafe filtrante.", points: 1, selection: false, validation: false),
    Challenge(description: "Acheter 5 produits plastique biodégradable.", points: 2, selection: false, validation: false),
    Challenge(description: "Partager ce challenge avec 5 autres personnes.", points: 1, selection: false, validation: false),
    Challenge(description: "Ne pas utiliser de plastique de la journée.", points: 1, selection: false, validation: false),
    Challenge(description: "Acheter des produits éco-friendly seulement.", points: 1, selection: false, validation: false),
    Challenge(description: "Recycler tes vêtements abîmés (en coussin, en serviette, en chiffon, en papier cadeau, en bracelet, en sac).", points: 3, selection: false, validation: false),
    Challenge(description: "Remplacer tes cotons, coton-tiges en plastique par des cotons-tiges en bambou ou silicone.", points: 3, selection: false, validation: false),
    Challenge(description: "Ne pas dépasser 19-20 degrés au niveau du chauffage et le réduire quand tu n’es pas là.", points: 3, selection: false, validation: false),
    Challenge(description: "Réduire ta consommation de viande.", points: 3, selection: false, validation: false),
    Challenge(description: "Réparer quelque chose plutôt de le jeter.", points: 3, selection: false, validation: false),
    Challenge(description: "Acheter une plante (ou plus).", points: 3, selection: false, validation: false),
    Challenge(description: "Acheter de saison et si possible, local.", points: 3, selection: false, validation: false),
    Challenge(description: "Transformer un produit en un autre, comme une canette de soda en pot à fleurs.", points: 3, selection: false, validation: false),
    Challenge(description: "Donner des vêtements que tu n’utilises plus depuis plus d’un an.", points: 3, selection: false, validation: false),
    Challenge(description: "Faire ton propre shampoing et gel-douche solide.", points: 3, selection: false, validation: false),
    Challenge(description: "Acheter une paille en inox et refuser les pailles en plastique dans les bras.", points: 3, selection: false, validation: false),
    Challenge(description: "Recycler 5 choses différentes.", points: 3, selection: false, validation: false),
    Challenge(description: "Préparer ta nourriture pour la semaine.", points: 3, selection: false, validation: false),
    Challenge(description: "Ramasser les déchets sur une plage, dans un parc ou dans la rue.", points: 3, selection: false, validation: false),
    Challenge(description: "Acheter ta nourriture en vrac.", points: 3, selection: false, validation: false),
    Challenge(description: "Aller à l’école ou au boulot en vélo.", points: 3, selection: false, validation: false),
    Challenge(description: "Utiliser un sac réutilisable pour tes courses.", points: 3, selection: false, validation: false),
    Challenge(description: "Acheter une gourde en inox et arrêter les bouteilles d’eau en plastique.", points: 3, selection: false, validation: false),
]

func initialChallenge() -> [Challenge] {
    var challenges =  [Challenge]()
    for _ in 0 ..< 3 {
        let challenge = choixChallenge.randomElement()!
        challenges.append(challenge)
    }
    return challenges
}
var resultChallenge = initialChallenge ()


struct LieuxTri: Identifiable {
    var id = UUID()
    var name: String
    var geo: CLLocationCoordinate2D
    var adress: String
    var type: TypeLieux
}

extension LieuxTri {
    static func getLieuxTri() -> [LieuxTri] {
        return [
            LieuxTri(name: "Bastille", geo: CLLocationCoordinate2D(latitude: 48.851765, longitude: 2.368777), adress: "50 Boulevard de la Bastille, 75012 Paris", type: .association),
            LieuxTri(name: "Panthéon", geo: CLLocationCoordinate2D(latitude: 48.8461908, longitude: 2.3460785), adress: "9 Place du Panthéon, 75005 Paris", type: .decheterie),
            LieuxTri(name: "Centre Georges Pompidou", geo: CLLocationCoordinate2D(latitude: 48.8605918, longitude: 2.3524743), adress: "19 Rue Beaubourg, 75003 Paris", type: .textile),
            LieuxTri(name: "Sacré Coeur", geo: CLLocationCoordinate2D(latitude: 48.8867, longitude: 2.3431),adress: "35 Rue du Chevalier de la Barre, 75018 Paris", type: .bennes),
            LieuxTri(name: "Arc de Triomphe", geo: CLLocationCoordinate2D(latitude: 48.8738, longitude: 2.2950),adress: "Arc de Triomphe, Place Charles de Gaulle, 75008 Paris", type: .grandeSurface),
            LieuxTri(name: "Palais Garnier", geo: CLLocationCoordinate2D(latitude: 48.8715, longitude: 2.3317),adress: "8 Rue Scribe, 75009 Paris", type: .autresLieux),
            LieuxTri(name: "Place Vendôme", geo: CLLocationCoordinate2D(latitude: 48.86735, longitude: 2.329367),adress: "Place Vendôme, Rue Saint-Honoré, 75001 Paris", type: .autresLieux),
            LieuxTri(name: "Place de la Concorde", geo: CLLocationCoordinate2D(latitude: 48.865256, longitude: 2.320956),adress: "Place de la Concorde, 75008 Paris", type: .grandeSurface)
        ]
    }
}

enum TypeLieux: String {
    case association = "Association"
    case decheterie = "Déchetterie"
    case textile = "Textile"
    case bennes = "Bennes"
    case grandeSurface = "Grande Surface"
    case autresLieux = "Autres Lieux"
}

