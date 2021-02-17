//
//  Recompense.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 09/02/2021.
//

import SwiftUI

struct Recompense: View {
    @ObservedObject var point: Points
    var body: some View {
        Text("J'ai \(point.count) points")
        
    }
}

struct Recompense_Previews: PreviewProvider {
    static var previews: some View {
        Recompense(point: Points())
    }
}
