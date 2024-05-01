//
//  ProfileVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 15/09/23.
//

import SwiftUI

final class ProfileVC: UIViewController, ButtonDelegate {
    func tappedExitAppButton() {
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

    var screen: ProfileScreen?
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let profileView = ProfileView(delegate: self)
        let hostingController = UIHostingController(rootView: profileView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                    hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        
        hostingController.didMove(toParent: self)
       // screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier, for: indexPath) as? ProfileImageTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
          //  cell?.setupCell(delegate: self)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}

//extension ProfileVC: ProfileTableViewCellScreenDelegate {
//    func tappedExitAppButton() {
//        let vc = LoginVC()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
//    }
//    
//    
//}
