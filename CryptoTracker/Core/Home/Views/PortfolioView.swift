//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 06/12/22.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedCoin: CoinModel?
    @State private var quantityText = ""
    @State private var showCheckMark = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .onChange(of: vm.searchText) { value in
                if value == "" {
                    removeSelectedCoin()
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            }
        }
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        let portfolioCoin = vm.portfolioCoins.first { $0.id == coin.id }
        
        if let portfolioCoin = portfolioCoin,
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            
            Divider()
            
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: selectedCoin?.currentPrice)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("SAVE")
            }
            .opacity((selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0)
        }
        .font(.headline)
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        
        return 0
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin else { return }
        guard let amount = Double(quantityText) else { return }
        
        // save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(HomeViewModel())
    }
}
