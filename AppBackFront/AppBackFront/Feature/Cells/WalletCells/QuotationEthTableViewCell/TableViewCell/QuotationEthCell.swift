//
//  QuotationEthCell.swift
//  AppBackFront
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import SwiftUI

struct QuotationEthCell: View {
    var ethValue: Double
    var valueInDollars: Double
    var coinEthImage: Image
    
    var body: some View {
        VStack(alignment:.leading) {
            Image("Vector")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.top, 10)
                .padding(.leading, 20)
            
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(QuotationCellColors.cellBackground))
            
                .overlay {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(ethValue,specifier: "%.2f") ETH")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(valueInDollars.formatted(.currency(code: "EUR")))                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(QuotationCellColors.ethValueTextColor))
                        }
                        Spacer()
                        Image("coin.ethereum")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(QuotationCellColors.background)
                .frame(height: 250)
                .frame(width: 700)
        )
    }
    
}


extension QuotationEthCell {
    init(quotationEthereum: QuotationEthereum) {
        self.ethValue = quotationEthereum.ethValue ?? 0
        self.valueInDollars = quotationEthereum.valueInDollars ?? 0
        self.coinEthImage = Image(quotationEthereum.coinEthImage ?? "")
    }
    
}

#Preview {
    QuotationEthCell(quotationEthereum: .sample)
}

extension QuotationEthereum {
    static let sample = QuotationEthereum(ethValue: 7.77, valueInDollars: 7_777.77, coinEthImage: "coin.ethereum")
}
