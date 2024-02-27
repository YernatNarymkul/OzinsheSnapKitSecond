//
//  ChangePasswordViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 27/01/2024.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {
    // MARK: PERSONAL_DATA_CELL
    let changePasswordCellView = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: PASSWORD_LABEL
    let passwordLabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: PASSWORD_TEXTFIELD
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
    //MARK: PASSWORD_IMAGE
    let passwordImage = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    //MARK: SHOW_PASSWORD_BUTTON
    lazy var showPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: REPEAT_PASSWORD_LABEL
    let repeatPasswordLabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: REPEAT_PASSWORD_TEXTFIELD
    // спросить как лучше писать написать код в рамках одного текст Feld или по отдельности например создавая текст филд мы добавляем туда картинку и кнопку или же лучше так как мы это делаем
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
    //MARK: PASSWORD_IMAGE_SECOND
    let passwordImageSecond = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    //MARK: SHOW_PASSWORD_BUTTON
    lazy var showPasswordButtonSecond = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonSecondTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: SEAVE_CHANGES_BUTTON
    let saveChangesButton = {
        let button = UIButton()
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        navigationItem.title = "Құпия сөзді өзгерту"
        
        setUpUI()
        locolizeLanguage()
        
    }
    // MARK: LOCOLIZE_LANGUAGE
    func locolizeLanguage() {
        navigationItem.title = "CHANGE_THE_PASSWORD".localized()
        passwordLabel.text = "PASSWORD".localized()
        passwordTextField.placeholder = "YOUR_PASSWORD".localized()
        repeatPasswordLabel.text = "REPEAT_PASSWORD_LABEL".localized()
        repeatPasswordTextField.placeholder = "YOUR_PASSWORD".localized()
        saveChangesButton.setTitle("SAVING_CHANGES".localized(), for: .normal)

    }
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @objc func showPasswordButtonSecondTapped() {
        repeatPasswordTextField.isSecureTextEntry = !repeatPasswordTextField.isSecureTextEntry
    }
    
    func setUpUI() {
        view.addSubview(changePasswordCellView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordImage)
        view.addSubview(showPasswordButton)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(passwordImageSecond)
        view.addSubview(showPasswordButtonSecond)
        view.addSubview(saveChangesButton)
        
        changePasswordCellView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(108)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(changePasswordCellView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        passwordImage.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField.snp.left).offset(16)
            make.centerY.equalTo(passwordTextField)
        }
        showPasswordButton.snp.makeConstraints { make in
            make.right.equalTo(passwordTextField.snp.right).inset(16)
            make.centerY.equalTo(passwordTextField)
        }
        repeatPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.left.equalToSuperview().offset(24)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        passwordImageSecond.snp.makeConstraints { make in
            make.centerY.equalTo(repeatPasswordTextField)
            make.left.equalTo(passwordTextField.snp.left).offset(16)
        }
        showPasswordButtonSecond.snp.makeConstraints { make in
            make.right.equalTo(repeatPasswordTextField.snp.right).inset(16)
            make.centerY.equalTo(repeatPasswordTextField)
        }
        saveChangesButton.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
    }
}
