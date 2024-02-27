//
//  SignInViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 14/02/2024.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
import Localize_Swift

class SignInViewController: UIViewController {
    // MARK: helloLabel
    let helloLabel = {
        let label = UILabel()
        label.text = "Сәлем"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    // MARK: helloLabel
    let accauntLabel = {
        let label = UILabel()
        label.text = "Аккаунтқа кіріңіз"
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
        textField.textColor = UIColor(named: "111827 - FFFFFF")
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    //MARK: emailImage
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
    //MARK: questionLabel
    let questionLabel = {
        let label = UILabel()
        label.text = "Құпия сөзді ұмыттыңыз ба?"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        
        return label
    }()
    //MARK: entranceButton
    lazy var signInButton = {
        let button = UIButton()
        button.setTitle("Кіру", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: noAccauntLabel
    let noAccauntLabel = {
        let label = UILabel()
        label.text = "Аккаунтыныз жоқ па?"
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.5, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        
        return label
    }()
    //MARK: registrationButton
    lazy var registrationButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medum", size: 14)
        
        return button
    }()
    //MARK: nextLabel
    let nextLabel = {
        let label = UILabel()
        label.text = "Немесе"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        
        return label
    }()
    //MARK: appleRegistrationButton
    let appleRegistrationButton = {
        let button = UIButton()
        button.setTitle("Apple ID-мен тіркеліңіз", for: .normal)
        button.backgroundColor = UIColor(named: "FFFFFF - 111827")
        button.setTitleColor(UIColor(named: "374151 - 1C2431"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        button.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        
        return button
    }()
    //MARK: appleImage
    let appleImage = {
        let image = UIImageView()
        image.image = UIImage(named: "apple")
        
        return image
    }()
    //MARK: googleRegistrationButton
    let googleRegistrationButton = {
        let button = UIButton()
        button.setTitle("Google-мен тіркеліңіз", for: .normal)
        button.backgroundColor = UIColor(named: "FFFFFF - 111827")
        button.setTitleColor(UIColor(named: "374151 - 1C2431"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        button.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    //MARK: googleImage
    let googleImage = {
        let image = UIImageView()
        image.image = UIImage(named: "google")
        
        return image
    }()
  
    //MARK: viewDidAppear
    override func viewWillAppear(_ animated: Bool) {
        locolizeLanguage()
    }
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        emailTextField.delegate = self
        passwordTextField.delegate = self
        hideKeyboardWhenTappedAround()
        setUpUi()
    }
    //MARK: signIn
    @objc func signInTapped() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        SVProgressHUD.show()
        
        let parameters = ["email": email, "password": password]
        
        AF.request(Urls.SIGN_IN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            
            SVProgressHUD.dismiss()
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if let token = json["accessToken"].string {
                    Storage.sharedInstance.accessToken = token
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    self.startApp()
                } else {
                    SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
                }
            } else {
                var ErrorString = "CONNECTION_ERROR".localized()
                    if let sCode = response.response?.statusCode {
                        ErrorString = ErrorString + "\(sCode)"
                    }
                    ErrorString = ErrorString + "\(resultString)"
                    SVProgressHUD.showError(withStatus: "\(ErrorString)")
            }
        }
    }
    
    func startApp() {
        let tabBarViewController = TabBarController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController, animated: true, completion: nil)
    }
    //MARK: locolizeLanguage
    func locolizeLanguage() {
        helloLabel.text = "HELLO_LABEL".localized()
        accauntLabel.text = "ACCAUNT_LABEL".localized()
        emailTextField.placeholder = "EMAIL_TEXTFIELD".localized()
        passwordLabel.text = "PASSWORD_LABEL".localized()
        passwordTextField.placeholder = "PASSWORD_TEXTFIELD".localized()
        questionLabel.text = "QUESTION_LABEL".localized()
        signInButton.setTitle("ENTERANCE_BUTTON".localized(), for: .normal)
        noAccauntLabel.text = "NO_ACCAUNT_LABEL".localized()
        registrationButton.setTitle("REGISTRATION_BUTTON".localized(), for: .normal)
        nextLabel.text = "NEXT_LABEL".localized()
        appleRegistrationButton.setTitle("APPLE_REGISTRTION_BUTTON".localized(), for: .normal)
        googleRegistrationButton.setTitle("GOOGLE_REGISTRATION_BUTTON".localized(), for: .normal)
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
    //MARK: showPasswordButtonTapped
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    //MARK: registrationButtonTapped
    @objc func registrationButtonTapped() {
        let registrationVC = RegistrationViewController()
        
        registrationVC.modalPresentationStyle = .fullScreen
        navigationController?.show(registrationVC, sender: self)
        navigationItem.title = ""
    }
    //MARK: setUpUi
    func setUpUi() {
        view.addSubview(helloLabel)
        view.addSubview(accauntLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailImage)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordImage)
        view.addSubview(showPasswordButton)
        view.addSubview(questionLabel)
        view.addSubview(signInButton)
        view.addSubview(noAccauntLabel)
        view.addSubview(registrationButton)
        view.addSubview(nextLabel)
        view.addSubview(appleRegistrationButton)
        view.addSubview(appleImage)
        view.addSubview(googleRegistrationButton)
        view.addSubview(googleImage)
        
        helloLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(124)
            make.left.equalToSuperview().offset(24)
        }
        accauntLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(accauntLabel.snp.bottom).offset(32)
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
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.right.equalToSuperview().inset(24)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        noAccauntLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.right.equalTo(registrationButton.snp.left).offset(-1)
        }

        registrationButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.centerY.equalTo(noAccauntLabel)
        }
        nextLabel.snp.makeConstraints { make in
            make.top.equalTo(noAccauntLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        appleRegistrationButton.snp.makeConstraints { make in
            make.top.equalTo(nextLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        appleImage.snp.makeConstraints { make in
            make.centerY.equalTo(appleRegistrationButton)
            make.left.equalTo(appleRegistrationButton.snp.left).offset(69)
        }
        googleRegistrationButton.snp.makeConstraints { make in
            make.top.equalTo(appleRegistrationButton.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        googleImage.snp.makeConstraints { make in
            make.centerY.equalTo(googleRegistrationButton)
            make.left.equalTo(googleRegistrationButton.snp.left).offset(69)
        }
        
    }
}
//MARK: extension textFieldDidBeginEditing
extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
           emailTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == passwordTextField {
           passwordTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
       }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
           emailTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        } else if textField == passwordTextField {
           passwordTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
       }
    }
}
