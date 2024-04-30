//
//  NftTableViewCell.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 09/09/23.
//

import UIKit

final class NftTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftTableViewCell.self)
    private var network: Network = .shared
    
    private lazy var screen: NftTableViewCellScreen = {
        let view = NftTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: Nft) {
        if let urlNFT: URL = URL(string: data.nftImage ?? ""), let urlUser: URL = URL(string: data.userImage ?? "") {
            
            configureNftImage(url: urlNFT)
            screen.nftImageView.backgroundColor = .white
            
            configUserImageView(url: urlUser)
            screen.userImageView.backgroundColor = .white
        }
        screen.priceLabel.text = data.price ?? ""
        screen.priceValueLabel.text = "\(data.nftPrice ?? 0.0) ETH"
        screen.ownedByPriceLabel.text = data.ownedBy
        screen.userLabel.text = data.userName
    }
    
    private func configUserImageView(url: URL) {
        network.requestImage(url: url) { result, failure in
            if failure != nil {
                RunLoop.main.perform { [weak self] in
                    self?.screen.userImageView.image = UIImage(systemName: "person.circle.fill")
                }
            } else {
                RunLoop.main.perform { [weak self] in
                    self?.screen.userImageView.image = result
                }
            }
        }
    }
    
    private func configureNftImage(url: URL) {
        network.requestImage(url: url) { result, failure in
            if failure != nil {
                RunLoop.main.perform { [weak self] in
                    self?.screen.nftImageView.image = UIImage(systemName: "threeButtons")
                }
            } else {
                RunLoop.main.perform { [weak self] in
                    self?.screen.nftImageView.image = result
                }
            }
        }
    }
}
