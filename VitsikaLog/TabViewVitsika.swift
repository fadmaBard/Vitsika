//
//  TabViewVitsika.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 09/02/2021.
//

import SwiftUI

struct TabViewVitsika: View {
    
    @State var hideLoggin: Bool = false
    
    var body: some View {
        
        ZStack {
            TabView {
                NavigationView {DefiView(point: Points())}
                    .tabItem {
                        Image(systemName: "arrow.3.trianglepath")
                        Text("Recycle")
                    }
                NavigationView {MapView()}
                    .tabItem {
                        Image(systemName: "map")
                        Text("Carte")
                    }
                NavigationView {MonCompte(points: Points())}
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profil")
                    }
            }
            .accentColor(Color("roseVitsika"))
            .zIndex(hideLoggin ? 1 : 0)
            
            LogView(hideLoggin: $hideLoggin)
                .zIndex(hideLoggin ? 0 : 1)
                .animation(Animation.easeInOut.speed(0.6))
        }
    }
}

struct TabViewVitsika_Previews: PreviewProvider {
    static var previews: some View {
        TabViewVitsika()
    }
}
