//
//  ViewController.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 12/08/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        loginScreen = LoginScreen()
        alert = AlertController(controller: self)
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
        isEnabledLoginButton(false)
    }
    
    func validateTextFields() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnabledLoginButton(true)
        } else {
            isEnabledLoginButton(false)
        }
    }
    
    func isEnabledLoginButton(_ isEnable: Bool) {
        if isEnable {
            loginScreen?.LoginButton.setTitleColor(.white, for: .normal)
            loginScreen?.LoginButton.isEnabled = true
            loginScreen?.subLoginImageView.alpha = 1
        } else {
            loginScreen?.LoginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.LoginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.4
        }
    }
}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
            if error != nil {
                // deu ruim
                print(error?.localizedDescription ?? "")
                self.alert?.getAlert(title: "Falha no Login", message: error?.localizedDescription ?? "", completion: {
                   
                })
            } else {
                // não tenho erro.
                let vc: TabBarVC = TabBarVC()
                self.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                print("Sucesso")
            }
            
        })
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 1
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
