//
//  RegistrationViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 17/02/2024.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
import Localize_Swift

class RegistrationViewController: UIViewController {
    // MARK: registrationLabel
    let registrationLabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    // MARK: userDataLabel
    let userDataLabel = {
        let label = UILabel()
        label.text = "Деректерді толтырыңыз"
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.5, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    // MARK: emailLabel
    let emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: emailTextField
    let emailTextField = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.keyboardType = .emailAddress
        //textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()  //MARK: emailImage
    let emailImage = {
        let image = UIImageView()
        image.image = UIImage(named: "email")
        
        return image
    }()
    //MARK: passwordLabel
    let passwordLabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: passwordTextField
    let passwordTextField = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    //MARK: passwordImage
    let passwordImage = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    //MARK: showPasswordButton
    lazy var showPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: repeatPasswordLabel
    let repeatPasswordLabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: repeatPasswordTextField
    let repeatPasswordTextField = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    //MARK: repeatPasswordImage
    let repeatPasswordImage = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    //MARK: repeatShowPasswordButton
    lazy var repeatShowPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector(repeatShowPasswordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: registrationButton
    lazy var registrationButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        
        return button
    }()
    //MARK: questionLabel
    let noAccauntLabel = {
        let label = UILabel()
        label.text = "Сізде аккаунт бар ма?"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        
        return label
    }()
    //MARK: repeatRegistrationButton
    lazy var repeatRegistrationButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1), for: .normal)
        //button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medum", size: 14)
        
        return button
    }()
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        hideKeyboardWhenTappedAround()
        setUpUI()
    }
    //MARK: hideKeyboardWhenTappedAround
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func registrationButtonTapped() {
        let registrationVC = TabBarController()
        
        registrationVC.modalPresentationStyle = .fullScreen
        navigationController?.show(registrationVC, sender: self)
        navigationItem.title = ""
    }
    
    func setUpUI() {
        view.addSubview(registrationLabel)
        view.addSubview(userDataLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailImage)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordImage)
        view.addSubview(showPasswordButton)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(repeatPasswordImage)
        view.addSubview(repeatShowPasswordButton)
        view.addSubview(registrationButton)
        view.addSubview(noAccauntLabel)
        view.addSubview(repeatRegistrationButton)
        
        registrationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalToSuperview().offset(24)
        }
        userDataLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationLabel.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(userDataLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        emailImage.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.left.equalTo(emailTextField.snp.left).offset(16)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        passwordImage.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.left.equalTo(passwordTextField.snp.left).offset(16)
        }
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField.snp.right).inset(16)
        }
        repeatPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        repeatPasswordImage.snp.makeConstraints { make in
            make.centerY.equalTo(repeatPasswordTextField)
            make.left.equalTo(repeatPasswordTextField.snp.left).offset(16)
        }
        repeatShowPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(repeatPasswordTextField)
            make.right.equalTo(repeatPasswordTextField.snp.right).inset(16)
        }
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(94)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        noAccauntLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationButton.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(94)
        }
        repeatRegistrationButton.snp.makeConstraints { make in
            make.centerY.equalTo(noAccauntLabel)
            make.leading.equalTo(noAccauntLabel.snp.trailing).offset(2)
        }
    }
    
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func repeatShowPasswordButtonTapped() {
        repeatPasswordTextField.isSecureTextEntry = !repeatPasswordTextField.isSecureTextEntry
    }
}
//MARK: textFieldDidBeginEditing
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == passwordTextField {
            passwordTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == repeatPasswordTextField {
            repeatPasswordTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == passwordTextField {
            passwordTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == repeatPasswordTextField {
            repeatPasswordTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        }
    }
}
