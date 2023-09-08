//
//  NftFilterCollectionViewCell.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 08/09/23.
//

import UIKit

class NftFilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: NftFilterCollectionViewCell.self)
    
    private lazy var screen: NftFilterCollectionViewCellScreen = {
        let view = NftFilterCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(filter: FilterNft) {
        screen.filterLabel.text = filter.title ?? ""
        if filter.isSelected ?? false {
            screen.filterLabel.backgroundColor = .purple
        } else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
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
}
