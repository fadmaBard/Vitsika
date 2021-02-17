//
//  Map Pin.swift
//  ModelDonnees
//
//  Created by Elmyre Gargar on 05/02/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var currentFilter: TypeLieux?
    @State var showModal = false
    @State var currentLieu: LieuxTri?
    @State private var otherSheet = 0
    @State private var couleurTrash: Color = .gray
    @State var showButton = false
    @State private var pickerSelection = 0
    @State private var lieuxCollecte: [LieuxTri] = LieuxTri.getLieuxTri()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
    
    var lieuxCollecteFiltre: [LieuxTri] {
        guard let theFilter = self.currentFilter else { return lieuxCollecte }
        return lieuxCollecte.filter { $0.type == theFilter }
    }
    
    var body: some View {
        
        ZStack {
            
            
            VStack {
                HStack {
                    
                    Picker(selection: $pickerSelection, label: Text("Picker"))
                    {
                        Text("Carte").tag(0)
                        Text("Liste").tag(1)
                        Image(systemName: "line.horizontal.3.decrease.circle").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 70)
                }
                
                ZStack {
                    Map(coordinateRegion: $region, annotationItems: lieuxCollecteFiltre)  { location in
                        MapAnnotation(coordinate: location.geo, anchorPoint: CGPoint(x: 0.5, y: 0.5)){
                            Button(action: {
                                showButton.toggle()
                                currentLieu = location
                            }, label: {
                                switch location.type {
                                case TypeLieux.association:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.green)
                                case TypeLieux.decheterie:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.red)
                                case TypeLieux.textile:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.yellow)
                                case TypeLieux.bennes:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.blue)
                                case TypeLieux.grandeSurface:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.black)
                                case TypeLieux.autresLieux:
                                    Image(systemName: "trash.circle.fill").foregroundColor(.purple)
                                }
                                
                            })
                        }
                    }
                    if pickerSelection == 1 {
                        ScrollView {
                            Map_Liste()
                                .animation(.default)
                                .transition(.move(edge: .trailing))
                                .padding()
                                .background(Color.white)
                        }
                        
                    }
                    
                    if pickerSelection == 2 {
                        Filtre(pickerSelection: $pickerSelection, currentFilter: $currentFilter)
                            .animation(.default)
                            .transition(.move(edge: .trailing))
                            .padding()
                            .background(Color.white)
                    }
                    
                    if let currentL = currentLieu {
                        if showButton {
                            VStack {
                                Spacer()
                                BoutonDescription(btn: $showButton, lieuTri: currentL)
                            }
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Carte", displayMode: .inline)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
