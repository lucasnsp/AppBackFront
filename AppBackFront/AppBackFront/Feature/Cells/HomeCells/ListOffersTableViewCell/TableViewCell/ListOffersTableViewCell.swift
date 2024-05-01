//
//  ListOffersTableViewCell.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 13/09/23.
//

import UIKit

final class ListOffersTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ListOffersTableViewCell.self)
    let network: Network = .shared
    
    private lazy var screen: ListOffersTableViewCellScreen = {
        let view = ListOffersTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
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
    
    public func setupCell(data: LatestDeal, isInicial: Bool, isFinal: Bool) {
        configureUserImage(urlImage: data.userImage)
        
        if isInicial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
        
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        screen.nameUserLabel.text = data.userName ?? ""
        screen.nftPriceLabel.text = "\(data.nftPrice ?? 0 ) ETH"
        screen.lastVizualizationLabel.text = data.lastAccess ?? ""
    }

    private func configureUserImage(urlImage: String?) {
        guard let urlImage, let url = URL(string: urlImage) else { return
            screen.UserImageView.image = UIImage(systemName: "person.circle.fill")
        }
        network.requestImage(url: url) { result, failure in
            if failure != nil {
                RunLoop.main.perform { [weak self] in
                    self?.screen.UserImageView.image = UIImage(systemName: "person.circle.fill")
                }
            } else {
                RunLoop.main.perform { [weak self] in
                    self?.screen.UserImageView.image = result
                }
            }
        }
    }
}
