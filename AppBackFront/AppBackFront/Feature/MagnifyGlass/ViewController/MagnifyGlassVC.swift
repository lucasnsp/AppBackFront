//
//  MagnifyGlassVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit
import AlamofireImage

final class MagnifyGlassVC: UIViewController {
    
    private var screen: MagnifyGlassScreen?
    private var urlImage: String
    
    override func loadView() {
        screen = MagnifyGlassScreen()
        view = screen
    }
    
    required init(urlImage: String) {
        self.urlImage = urlImage
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
        screen?.nftImageView.af.setImage(withURL: url)
    }
}

extension MagnifyGlassVC: MagnifyGlassScreenDelegate {
    func tappedBackButton() {
        dismiss(animated: true)
    }
    
    
}
