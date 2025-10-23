//
//  TabBar.swift
//  POC-Signature
//
//  Created by Giulia Stefainski on 22/10/25.
//

import Foundation
import SwiftUI

struct TabBar: View {
    let gradient = LinearGradient(
            colors: [.darkBlueGradient, .lightBlueGradient, .greenGradient],
            startPoint: .leading,
            endPoint: .trailing
        )
    var body: some View {
        TabView {
            Tab("Explorar", systemImage: "books.vertical.fill") {
                NavigationStack {
                    BookView()
                }
            }
            
            Tab("Categorias", systemImage: "square.grid.2x2.fill") {
                NavigationStack {
                    CategoryView()
                }
            }
            Tab("Clube", systemImage: "star.hexagon.fill") {
                NavigationStack {
                    ClubeView()
                }
            }
        }
        .tint(.lightBlueGradient)
    }
}


#Preview {
    TabBar()
}
