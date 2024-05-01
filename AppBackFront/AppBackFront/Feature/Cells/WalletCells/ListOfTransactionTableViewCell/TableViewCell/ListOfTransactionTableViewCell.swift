//
//  ListOfTransactionTableViewCell.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 15/09/23.
//

import UIKit

final class ListOfTransactionTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListOfTransactionTableViewCell.self)
    
    private lazy var screen: ListOfTransactionTableViewCellScreen = {
        let view = ListOfTransactionTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = TransactionCellColors.background
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
    
    public func setupCell(data: ListOfTransaction, isInicial: Bool, isFinal: Bool) {
        screen.idTransactionLabel.text = data.idTransaction ?? ""
        screen.transactionImageView.image = UIImage(named: data.image ?? "")
        screen.valueInDollarLabel.text = "$\(data.valueDollar ?? 0)"
        screen.dateEndHourLabel.text = data.dateAndHour ?? ""
        
        if data.type == "exit" {
            screen.priceEthLabel.text = "-\(data.priceEth ?? 0) ETH"
            screen.priceEthLabel.textColor = TransactionCellColors.Exit.priceLabel
            screen.valueInDollarLabel.textColor = TransactionCellColors.Exit.valueLabel
            
            screen.dateEndHourLabel.textColor = TransactionCellColors.Exit.dateEndHourLabel
        } else {
            screen.priceEthLabel.text = "+\(data.priceEth ?? 0) ETH"
            screen.priceEthLabel.textColor =  TransactionCellColors.Other.priceLabel
            screen.valueInDollarLabel.textColor = TransactionCellColors.Other.valueLabel
            screen.dateEndHourLabel.textColor = TransactionCellColors.Other.dateEndHourLabel
        }
        
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        
        
        if isInicial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
        
    }
  

}
