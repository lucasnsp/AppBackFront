//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit

protocol WalletViewModelDelegate: AnyObject {
    func success()
    func error()
}

final class WalletViewModel {
    
    private let service: WalletService
    private weak var delegate: WalletViewModelDelegate?
    private var walletData: WalletData?
    
    init(service: WalletService = WalletService()) {
        self.service = service
    }
    
    public func delegate(delegate: WalletViewModelDelegate?) {
        self.delegate = delegate
    }
    
    
    public func fetch() {
        
        service.getWallet { result, failure in
            if let result {
                self.walletData = result
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    
    var numberOfRowsInSection: Int {
        return 2
    }
    
    public var quotationEthereum: QuotationEthereum {
        walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    public var latestTransactionsCell: LatestTransactionsCell {
        walletData?.latestTransactionsCell ?? LatestTransactionsCell()
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case.quotationEth:
            return 250
        case.transactionList:
            return HeighLatestTransactions.height.rawValue * CGFloat(walletData?.latestTransactionsCell?.listOfTransactions?.count ?? 0 ) + 75
        default:
            return 0
        }
    }
}
