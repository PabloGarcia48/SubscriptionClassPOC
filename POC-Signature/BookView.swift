//
//  BookView.swift
//  POC-Signature
//
//  Created by Pablo Garcia-Dev on 22/10/25.
//

import SwiftUI

struct BookView: View {
    @StateObject private var store = StoreManager()
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Destaques da semana
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Destaques da semana")
                            .font(.system(.title2, design: .rounded))
                            .padding(.leading, 14)
                        
                        HStack(spacing: 10) {
                            Image("Image")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Design")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .padding(.bottom,10)
                                Text("Não me faça pensar\n - Atualizado")
                                    .font(.callout)
                                    .foregroundColor(.primary)
                                Text("Steve Krug")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Text("Ler agora")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.black)
                                        .frame(width: 150, height: 25)
                                        .padding(4)
                                        .background(Color.darkBlueGradient)
                                        .cornerRadius(28)
                                        .shadow(radius: 5)
                                }
                                .padding(.bottom, 10)
                            }
                        }
                        .padding(.trailing, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.cardcolor)
                                .shadow(radius: 5)
                        )
                        .padding(.horizontal)
                    }
                    
                    // Fantasia
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Fantasia")
                            .font(.system(.title2, design: .rounded))
                            .padding(.leading, 14)
                        
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("O Hobbit")
                                Text("J.R.R. Tolkien")
                                    .font(.caption)
                            }
                            
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("Jogos Vor...")
                                Text("Suzane Collins")
                                    .font(.caption)
                            }
                            
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("As Crônica...")
                                Text("C. S. Lewis")
                                    .font(.caption)
                            }

                        }
                        .padding(.horizontal)
                    }
                    
                    // Literatura Brasileira
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Literatura Brasileira")
                            .font(.system(.title2, design: .rounded))
                            .padding(.leading, 14)
                        
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 6")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("Dom Cas...")
                                Text("Machado de A...")
                                    .font(.caption)
                            }
                            
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 7")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("Iracema")
                                Text("José de Alencar")
                                    .font(.caption)
                            }
                            
                            VStack(alignment: .leading) {
                                Button(action: {
                                    Task {
                                        if store.isSubscribed {
                                            alertMessage = "Parabéns!\nAgora você pode ler este livro!"
                                        } else {
                                            alertMessage = "Para ler este livro precisa fazer parte do clube!"
                                        }
                                        showAlert = true
                                    }
                                }) {
                                    Image("Image 8")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                Text("Vidas Secas")
                                Text("Graciliano Ramos")
                                    .font(.caption)
                            }

                        }
                        .padding(.horizontal)
                    }
                    
                }
                .padding(.vertical)
            }
            .navigationTitle("Explorar")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await store.fetchProducts()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    BookView()
}

