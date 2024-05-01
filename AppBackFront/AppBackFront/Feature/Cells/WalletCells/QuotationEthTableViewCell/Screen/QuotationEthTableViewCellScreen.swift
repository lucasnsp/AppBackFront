//
//  QuotationEthTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit

final class QuotationEthTableViewCellScreen: UIView {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Vector")
        return imageView
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = QuotationCellColors.cellBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = QuotationCellColors.borderColor
        return view
    }()
    
    lazy var ethValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var ethValueInDollarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = QuotationCellColors.ethValueTextColor
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var coinEthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = QuotationCellColors.background
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(backgroundView)
        addSubview(coinEthImageView)
        backgroundView.addSubview(ethValueLabel)
        backgroundView.addSubview(ethValueInDollarsLabel)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            backgroundView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalToConstant: 150),
            
            ethValueLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 50),
            ethValueLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            
            ethValueInDollarsLabel.topAnchor.constraint(equalTo: ethValueLabel.bottomAnchor, constant: 10),
            ethValueInDollarsLabel.leadingAnchor.constraint(equalTo: ethValueLabel.leadingAnchor),
            
            coinEthImageView.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            coinEthImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            coinEthImageView.widthAnchor.constraint(equalToConstant: 240), 

        ])
    }
}
