//
//  StoreManager.swift
//  POC-Signature
//
//  Created by Pablo Garcia-Dev on 20/10/25.
//

import Foundation
import StoreKit
import Combine

@MainActor
class StoreManager: ObservableObject {
    @Published var subscriptions: [Product] = []
    @Published var currentEntitlement: Product?
    @Published var isSubscribed = false

    // Mesmo ID do produto, tanto local quanto na App Store Connect
    let productIDs = [""]
    
    // MARK: - Inicializador
    init() {
        listenForTransactions() // Começa a escutar atualizações
    }

    // MARK: - Buscar produtos
    func fetchProducts() {

    }

    // MARK: - Comprar assinatura
    func purchase() {

    }

    // MARK: - Atualizar status atual
    func updateCurrentEntitlement() async {
        var activeSubscription: Product? = nil

        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result,
               productIDs.contains(transaction.productID) {
                activeSubscription = try? await Product.products(for: [transaction.productID]).first
            }
        }

        currentEntitlement = activeSubscription
        isSubscribed = (activeSubscription != nil)
    }

    // MARK: - Escutar atualizações de transações
    private func listenForTransactions() {
        Task.detached { [weak self] in
            guard let self = self else { return }
            for await verificationResult in Transaction.updates {
                if let transaction = await self.checkVerified(verificationResult) {
                    await transaction.finish()
                    await MainActor.run { print("Assinatura atualizada!") }
                    await self.updateCurrentEntitlement()
                }
            }
        }
    }

    // MARK: - Verificação de segurança
    func checkVerified<T>(_ result: VerificationResult<T>) -> T? {
        switch result {
        case .unverified(_, let error):
            print("❌ Transação não verificada: \(error)")
            return nil
        case .verified(let safe):
            return safe
        }
    }
}

