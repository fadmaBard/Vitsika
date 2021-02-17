//
//  SwiftUIView.swift
//  SuperInterface5
//
//  Created by Meiddy OUASTANI on 08/02/2021.
//

import SwiftUI

struct Challengejour: View {
    @State var selectedChallenge: Int? = nil
    @State var arrayChallenges = resultChallenge
    @State var activateNavigation = false

    @ObservedObject var point: Points
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color("roseVitsika"))
                        .opacity(0.4)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 390, height: 420)
                        .offset(y: -440)
                    
                    VStack {
                        ForEach(Array(zip(arrayChallenges.indices, arrayChallenges)), id: \.0) { index, challenges in
                            HStack {
                                Button(action: {
                                    
                                    if let unwrapChallenge = selectedChallenge{
                                        
                                        arrayChallenges[unwrapChallenge].selection.toggle()
                                        
                                    }
                                    arrayChallenges[index].selection.toggle()
                                    
                                    selectedChallenge=index
                                    
                                }, label: {
                                    Image(systemName: challenges.selection ? "largecircle.fill.circle" : "circle")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20, alignment: .leading)
                                })
                                Text(challenges.description)
                                    .padding()
                                    .foregroundColor(Color("greyVitsika"))
                                    .font(.title3)
                                
                                Spacer()
                            }
                        }
                    }
                    .frame(width: 300, height: 400, alignment: .center)
                    .lineSpacing(8)
                }
                
                HStack{
                    
                    Button(action: {
                        point.increment()
                        activateNavigation = true
                    }, label: {
                        Text("Je valide")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 45, alignment: .center)
                            .background(Color("greyVitsika"))
                            .cornerRadius(30)
                    })
                    NavigationLink (
                        destination: InterfRecompenseView(rootIsActive: $rootIsActive, point: point), isActive: $activateNavigation,
                        label: {
                            EmptyView()
                        })
                    
                }
            }
                .navigationBarTitle(Text("Défi du jour"), displayMode: .inline)
                
            }
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct Challengejour_Previews: PreviewProvider {
    static var previews: some View {
        Challengejour(point: Points(), rootIsActive: .constant(false))
    }
}

