//
//  MagnifyGlassVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit

final class MagnifyGlassVC: UIViewController {
    
    private var screen: MagnifyGlassScreen?
    private var urlImage: String
    private var network: Network
    
    override func loadView() {
        screen = MagnifyGlassScreen()
        view = screen
    }
    
    required init(urlImage: String, network: Network = .shared) {
        self.urlImage = urlImage
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        configImage()
    }
    
    private func configImage() {
        guard let url = URL(string: urlImage) else { return }
        network.requestImage(url: url) { result, failure in
            guard let result else { return }
            RunLoop.main.perform { [weak self] in
                self?.screen?.nftImageView.image = result
            }
        }
    }
}

extension MagnifyGlassVC: MagnifyGlassScreenDelegate {
    func tappedBackButton() {
        dismiss(animated: true)
    }
    
    
}
