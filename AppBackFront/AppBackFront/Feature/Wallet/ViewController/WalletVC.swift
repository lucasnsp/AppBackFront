//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 14/09/23.
//

import UIKit

class WalletVC: UIViewController {
    
    var screen: WalletScreen?
    var viewModel: WalletViewModel = WalletViewModel()
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch(.request)
    }
    
    
}
