//
//  LatestDealTableViewCellViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 13/09/23.
//

import UIKit

class LatestDealTableViewCellViewModel: NSObject {
    
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
        return 70
    }
}
