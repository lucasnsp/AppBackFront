//
//  LatestTransactionsViewCell.swift
//  AppBackFront
//
//  Created by Adrian Iraizos Mendoza on 30/4/24.
//

import SwiftUI

struct LatestTransactionsViewCell: View {
    let title: String
    let transactions: [ListOfTransaction]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
            
            ListOfTransactionTableView(transactions: transactions)
                .padding(.horizontal,10)
            Spacer()
            Spacer()
        }
      //  .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(TransactionCellColors.background)
            .frame(height: 1000)
            .frame(width: 700)
        )
    }
}

extension LatestTransactionsViewCell {
    init(cell: LatestTransactionsCell) {
        title = cell.latestTransactionsTitle ?? "Últimas transacciones"
        transactions = cell.listOfTransactions ?? []
    }
}
#Preview {
    LatestTransactionsViewCell(cell: .sample)
}

struct ListOfTransactionTableView: View {
    let transactions: [ListOfTransaction]
    var body: some View {
            List(transactions, id:\.idTransaction) { transaction in
                TransactionCell(data: transaction)
                    .listRowSeparatorTint(Color.gray,edges: .bottom)
            }
            .frame(maxHeight: 350)
            .background(Color(TransactionCellColors.background))
            .scrollContentBackground(.hidden)
            .listStyle(InsetListStyle())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(.gray,lineWidth: 1)
                        .padding(-5)
            )
    }
}

struct TransactionCell: View {
    let idLabel: String
    let date: String
    let price: Double
    let value: Double
    
    let dateColor: Color
    let priceColor: Color
    let valueColor: Color
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(idLabel)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(date)
                        .font(.subheadline)
                        .foregroundColor(dateColor)
                }
                .padding(.vertical, 15)
                Spacer()
                VStack {
                    Text("\(price,specifier: "%.2f") ETH")
                        .foregroundStyle(priceColor)
                        .font(.title2.bold())
                    Text("\(value.formatted(.currency(code: "EUR")))")
                        .foregroundStyle(valueColor)
                        .font(.subheadline.bold())
                }
            }
        }
        .background(
            ZStack{
                
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color(TransactionCellColors.background))
            }
                .padding(-30)
        )
    }
}

extension TransactionCell {
    init(data: ListOfTransaction) {
        let isExit = data.type == "exit"
        idLabel = data.idTransaction ?? ""
        date = data.dateAndHour ?? ""
        price = data.priceEth ?? 0
        value = data.valueDollar ?? 0
        dateColor = isExit ? Color(TransactionCellColors.Exit.dateEndHourLabel) : Color(TransactionCellColors.Other.dateEndHourLabel)
        priceColor = isExit ? Color(TransactionCellColors.Exit.priceLabel) : Color(TransactionCellColors.Other.priceLabel)
        valueColor = isExit ? Color(TransactionCellColors.Exit.valueLabel) : Color(TransactionCellColors.Other.valueLabel)
    }
}

extension ListOfTransaction {
    static let sample = ListOfTransaction(type: "exit", idTransaction: "bnalsnlfn3216dfvcs154", image: nil, priceEth: 1.2, valueDollar: 1393.49, dateAndHour: "10/07/2022 16:50")
    static let sampleList = [
        ListOfTransaction(type: "exit", idTransaction: UUID().uuidString, image: nil, priceEth: 1.2, valueDollar: 1393.49, dateAndHour: "10/07/2022 16:50"),
        ListOfTransaction(type: "entry", idTransaction: UUID().uuidString, image: nil, priceEth: -0.8, valueDollar: 993.49, dateAndHour: "10/07/2022 10:10"),
        ListOfTransaction(type: "exit", idTransaction: UUID().uuidString, image: nil, priceEth: 3.2, valueDollar: 2413.49, dateAndHour: "9/07/2022 09:40"),
        ListOfTransaction(type: "entry", idTransaction: UUID().uuidString, image: nil, priceEth: -1.1, valueDollar: 1793.49, dateAndHour: "9/07/2022 19:12")
    ]
    
}

extension LatestTransactionsCell {
    static let sample = LatestTransactionsCell(latestTransactionsTitle: "Últimas transacciones", listOfTransactions: ListOfTransaction.sampleList)
}
