//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 07/09/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

final class HomeViewModel {
    
    private let service: HomeService
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    private weak var delegate: HomeViewModelDelegate?
    
    
    init(service: HomeService = HomeService()) {
        self.service = service
    }
    
    public func delegate(delegate:HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest() {
        service.getHomeFromJson { result, failure in
            if let result {
                self.nftData = result
                self.searchNftData = result
                self.delegate?.success()
            } else {
          //      print(failure as Any)
                self.delegate?.error()
            }
        }
    }
    
    // MARK: - FilterCollectionView
    
    public var numberOfItemsInSection: Int {
        searchNftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        CGSize(width: 100, height: 34)
    }
    
    
    // MARK: - NftTableViewCell
    
    public var numberOfRowsInSection: Int {
        searchNftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    
    // MARK: - Filter(SearchBar)
    
    var typeFilter: Int? {
        return searchNftData?.filterListNft?.first(where: {$0.isSelected == true})?.id
    }
        
    public func filterSearchText(_ text: String) {
        
        var nftList: [Nft] = []
       
        if typeFilter == 0 { /* o zero significa todos */
            nftList = nftData?.nftList ?? []
        } else {
            nftList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        if text.isEmpty {
            searchNftData?.nftList = nftList
        } else {
            searchNftData?.nftList = nftList.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
    
    // MARK: - Filter(CollectionView)
    
    public func setFilter(indexPath: IndexPath, searchText: String) {
        var filterNFT: [FilterNft] = []
        for (index, value) in (searchNftData?.filterListNft ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNftData?.filterListNft = filterNFT
        filterSearchText(searchText)
    }
}
