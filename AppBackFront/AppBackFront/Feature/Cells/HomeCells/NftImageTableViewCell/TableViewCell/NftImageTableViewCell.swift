//
//  NftImageTableViewCell.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 12/09/23.
//

import UIKit

final class NftImageTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftImageTableViewCell.self)
    let network: Network = .shared
    
    private lazy var screen: NftImageTableViewCellScreen = {
        let view = NftImageTableViewCellScreen()
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
    
    public func setupCell(urlImage: String, delegate: NftImageTableViewCellScreenDelegate) {
        configureNftImage(urlImage: urlImage)
        screen.delegate(delegate: delegate)
    }
    
    private func configureNftImage(urlImage: String) {
        guard let url = URL(string: urlImage) else { return
            screen.nftImageView.image = UIImage(systemName: "threeButtons")
        }
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
