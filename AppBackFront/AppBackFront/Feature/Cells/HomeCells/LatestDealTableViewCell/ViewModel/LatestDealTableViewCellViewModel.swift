//
//  LatestDealTableViewCellViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 13/09/23.
//

import UIKit

enum HeighLatestDeal: CGFloat {
    case height = 70
}

final class LatestDealTableViewCellViewModel: NSObject {
    
    var nft: Nft?
    
    public func setNft(nft: Nft) {
        self.nft = nft
    }
    
    public var title: String {
        return nft?.titleLatestDeals ?? ""
    }
    
    public var numberOfRowsInSection: Int {
        return nft?.latestDeals?.count ?? 0 
    }
    
    public var heightForRowAt: CGFloat {
        return HeighLatestDeal.height.rawValue
    }
    
    public func loadCurrentLatestDeal(indexPath: IndexPath) -> LatestDeal {
        return nft?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    
    public func isInicial(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    public func isFinal(indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
}
