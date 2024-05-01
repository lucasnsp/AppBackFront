//
//  NftDetailVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 11/09/23.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case description = 1
    case latestDeal = 2
}

final class NftDetailVC: UIViewController {
    
    private var screen: NftDetailScreen?
    private let viewModel: NftDetailViewModel
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension NftDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case.nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
            
        case.description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNft, title: viewModel.titleNft, description: viewModel.nftDescription)
            return cell ?? UITableViewCell()
            
        case.latestDeal:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell
            cell?.setupCell(data: viewModel.getNft)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath, width: view.frame.width)
    }
}

extension NftDetailVC: NftImageTableViewCellScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        present(MagnifyGlassVC(urlImage: viewModel.nftImage), animated: true)
    }
    
    
}
