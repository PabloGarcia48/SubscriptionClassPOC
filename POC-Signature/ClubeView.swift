//
//  ClubeView.swift
//  POC-Signature
//
//  Created by Pablo Garcia-Dev on 22/10/25.
//

import SwiftUI

struct ClubeView: View {
    @StateObject private var store = StoreManager()
    
    
    var body: some View {
        VStack(spacing: 24){
            VStack{
                Image("logo3d")
                    .resizable()
                    .frame(width: 190, height: 245)
                
                HStack{
                    Text("Faça Parte do")
                        .font(.largeTitle)
                        .bold()
                    Text("Clube")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.darkBlueGradient)
                }
                .padding(.top, -40)
                
                Text("tenha acesso a mais de 500 livros")
                    .font(.title3)
                
                Text("exclusivos para você")
                    .font(.title3)
            }
            .padding(.top, -30)
            
            VStack{
                HStack(){
                    Text("Benefícios do")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    Text("Clube")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(Color.darkBlueGradient)
                    Spacer()
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Label("Acesso a mais de 500 livros", systemImage: "star")
                    Label("Leituras totalmente offline", systemImage: "star")
                    Label("Novos livros toda semana", systemImage: "star")
                }
                .padding(.leading, -90)
                .font(.body)
                .labelStyle(.titleAndIcon)
                .foregroundColor(.primary)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.cardcolor)
                    .shadow(radius: 5)
            )
            .padding(.horizontal)
            VStack{
                HStack{
                    Spacer()
                    Text("Plano")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    Text("Mensal")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(Color.darkBlueGradient)
                }
                .padding(.trailing, 20)
                
                VStack(alignment: .trailing, spacing: 8) {
                    Label("Acesso ilimitado por R$27.90/mês", systemImage: "star")
                    Label("Cobrança totalmente automática", systemImage: "star")
                    Label("Sem taxas ou custos extras", systemImage: "star")
                }
                .font(.body)
                .labelStyle(.titleAndIcon)
                .foregroundColor(.primary)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.cardcolor)
                    .shadow(radius: 5)
            )
            .padding(.horizontal)
            
            Button(action: {
                Task {
                    if let product = store.subscriptions.first {
                        await store.purchase(product)
                    } else {
                        await store.fetchProducts()
                    }
                }
            }) {
                Text("Faça Parte do Clube")
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.darkBlueGradient)
                    .cornerRadius(28)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
        }
        .task {
            await store.fetchProducts()
        }
    }
}

#Preview {
    ClubeView()
}
