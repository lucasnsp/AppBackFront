//
//  AlertController.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 06/09/23.
//

import UIKit

final class AlertController: NSObject {

    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: { share in
            completion?()
        })
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
    }
}
