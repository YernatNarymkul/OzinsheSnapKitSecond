//
//  UserInfoViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 27/01/2024.
//

import UIKit
import SnapKit
import Localize_Swift

class UserInfoViewController: UIViewController {
    // MARK: PERSONAL_DATA_CELL
    let personalDataCellView = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: YOUR_NAME_LABEL
    let yourNameLabel = {
        let label = UILabel()
        label.text = "Сіздің атыңыз"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: NAME_TEXTFIELD
    let nameTextField = {
        let textField = UITextField()
        textField.placeholder = "Айдар"
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    // MARK: YOUR_NAME_TEXT_FIELD_CELL_VIEW
    let yourNameTextFieldCellVew = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: email_label
    let emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: EMAIL_TEXTFIELD
    // спросить как написать код для изменения цвета вводимого текста
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    // MARK: EMAIL_TEXT_FIELD_CELL_VIEW
    let emailTextFieldCellVew = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: TELEPHONE_LABEL
    let telephoneLabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: TELEPHONE_TEXTFIELD
    // спросить как написать код для изменения цвета вводимого текста
    let telephoneTextField = {
        let textField = UITextField()
        textField.placeholder = "+7 702 732-10-31"
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    // MARK: TELEPHONE_TEXT_FIELD_CELL_VIEW
    let telephoneTextFieldCellVew = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: BIRTHDAY_LABEL
    let birthdayLabel = {
        let label = UILabel()
        label.text = "Туылған күні"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    //MARK: BIRTHDAY_TEXTFIELD
    // спросить как написать код для изменения цвета вводимого текста
    let birthdayTextField = {
        let textField = UITextField()
        textField.placeholder = "19 Қыркүйек 2004"
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    // MARK: BIRTHDAY_TEXT_FIELD_CELL_VIEW
    let birthdayTextFieldCellVew = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    // MARK: SEAVE_CHANGES_BUTTON
    lazy var saveChangesButton = {
        let button = UIButton()
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(saveInfoButtonTopped), for: .touchUpInside)
        
        return button
    }()
    // MARK: VIEW_DID_LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        navigationItem.title = "Жеке деректер"
        
        setUpUI()
        locolizeLanguage()
    }
    // MARK: LOCOLIZE_LANGUAGE
    func locolizeLanguage() {
        yourNameLabel.text = "YOUR_NAME".localized()
        telephoneLabel.text = "TELEPHONE".localized()
        birthdayLabel.text = "DATA_OF_BIRTH".localized()
        navigationItem.title = "PERSONAL_DATA".localized()
        saveChangesButton.setTitle("SAVING_CHANGES".localized(), for: .normal)
    }
    // MARK: saveInfoButtonTopped
    @objc func saveInfoButtonTopped(){
//        let updatedName = nameTextField.text ?? ""
//        let updatedEmail = emailLabel.text ?? ""
//        let updatedBirth = birthdayTextField.text ?? ""
//        let updatedPhone = telephoneTextField.text ?? ""
        
//        updateUserInfo(updatedName: updatedName, updatedEmail: updatedEmail, updatedBirth: updatedBirth, updatedPhone: updatedPhone)
    }
    // MARK: setUpUI
    func setUpUI() {
        
        view.addSubview(personalDataCellView)
        view.addSubview(yourNameLabel)
        view.addSubview(nameTextField)
        view.addSubview(yourNameTextFieldCellVew)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailTextFieldCellVew)
        view.addSubview(telephoneLabel)
        view.addSubview(telephoneTextField)
        view.addSubview(telephoneTextFieldCellVew)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdayTextFieldCellVew)
        view.addSubview(saveChangesButton)
        
        personalDataCellView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(108)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        yourNameLabel.snp.makeConstraints { make in
            make.top.equalTo(personalDataCellView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(yourNameLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        yourNameTextFieldCellVew.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(yourNameTextFieldCellVew.snp.bottom).offset(24)
            make.left.equalTo(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        emailTextFieldCellVew.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        telephoneLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextFieldCellVew.snp.bottom).offset(24)
            make.left.equalTo(24)
        }
        telephoneTextField.snp.makeConstraints { make in
            make.top.equalTo(telephoneLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        telephoneTextFieldCellVew.snp.makeConstraints { make in
            make.top.equalTo(telephoneTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        birthdayLabel.snp.makeConstraints { make in
            make.top.equalTo(telephoneTextFieldCellVew.snp.bottom).offset(24)
            make.left.equalTo(24)
        }
        birthdayTextField.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        birthdayTextFieldCellVew.snp.makeConstraints { make in
            make.top.equalTo(birthdayTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        saveChangesButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(56)
            
        }
    }
}

