//
//  ProfileViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 20/01/2024.
//

import UIKit
import SnapKit
import Localize_Swift

class ProfileViewController: UIViewController, LanguageProtocol {
    //MARK: PROFILE_LABEL
    // Спросить как можно сделать по другому (например добавить в navigationItem)
    let profileLabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        
        return label
    }()
    // MARK: PROFILE_CELL
    let profileCellView = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: PROFILE_IMAGE_VIEW
    let profileImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "avatar")
        
        return profileImageView
    }()
    //MARK: MY_PROFFILE_LABEL
    let myProfileLabel = {
        let label = UILabel()
        label.text = "Менің профилім"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    // MARK: EMAIL_LABEL
    let emailLabel = {
        let label = UILabel()
        label.text = "ali@gmail.com"
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        return label
    }()
    // MARK: BACK_VIEW
    let backView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        
        return view
    }()
    // MARK: PERSONAL_DATA_BUTTON
    lazy var personalDataButton = {
        let button = UIButton()
        button.setTitle("Жеке деректер", for: .normal)
        button.setTitleColor(UIColor(named: "111827 - FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(personalDataButtonTopped), for: .touchUpInside)
        
        return button
    }()
    //MARK: PERSONAL_DATA_BUTTON_CELL
    let personalDataButtonCell = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: LABEL_PERSONAL_DATA_BUTTON
    let personalDataButtonLabel = {
        let label = UILabel()
        label.text = "Өңдеу"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        return label
    }()
    //MARK: PERSONOL_DATA_BUTTON_ARRROW_IMAGE
    let arrowImage = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "arrow")
        
        return arrowImage
    }()
    //MARK: CHANGE_PASSWORD_BUTTON
    lazy var changePasswordButton = {
        let button = UIButton()
        button.setTitle("Құпия сөзді өзгерту", for: .normal)
        button.setTitleColor(UIColor(named: "111827 - FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(changePasswordButtonTopped), for: .touchUpInside)
    
        return button
    }()
    //MARK: CHANGE_PASSWORD_BUTTON_ARROW
    let arrowImageChangePassswordButton = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "arrow")
        
        return arrowImage
    }()
    //MARK: CHANGE_PASSWORD_BUTTON_CELL
    let changePasswordButtonCell = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    // MARK: LANGUAGE_BUTTON_TOPPED
    lazy var languageButton = {
        let button = UIButton()
        button.setTitle("Тіл", for: .normal)
        button.setTitleColor(UIColor(named: "111827 - FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(languageButtonTopped), for: .touchUpInside)
        
        return button
    }()
    // MARK: LANGUAGE_LABEL
    let languageLabel = {
        let label = UILabel()
        label.text = "Қазақша"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        return label
    }()
    //MARK: CHANGE_PASSWORD_BUTTON_ARROW
    let arrowImageLanguageButton = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "arrow")
        
        return arrowImage
    }()  //MARK: TERMS_AND_CONDITION_CELL
    let TermsAndConditionsCell = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: TERMS_AND_CONDITION_BUTTON
    lazy var termsAndConditionButton = {
        let button = UIButton()
        button.setTitle("Ережелер мен шарттар", for: .normal)
        button.setTitleColor(UIColor(named: "111827 - FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(termsAndConditionButtonTopped), for: .touchUpInside)
        
        
        return button
    }()
    //MARK: ARROW_IMAGE_TERMS_AND_CONDITION_BUTTON
    let arrowIamgeTermsAndConditionButton = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "arrow")
        
        return arrowImage
    }()
    //MARK: ADS_LABEL
    let adsLabel = {
        let label = UILabel()
        label.text = "Хабарландырулар"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = UIColor(named:"111827 - FFFFFF")
     
        return label
    }()
    //MARK: ADS_BUTTON_CELL
    let adsButtonCell = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: ADS_MODE_SWITCH
    lazy var adsModeSwitch = {
        let dMSwitch = UISwitch()
        
        dMSwitch.onTintColor = UIColor(red: 0.702, green: 0.463, blue: 0.969, alpha: 1)
        dMSwitch.thumbTintColor = UIColor(red: 0.9, green: 0.91, blue: 0.92, alpha: 1)
        dMSwitch.addTarget(self, action: #selector(changeSwitch), for: .touchUpInside)
        
        return dMSwitch
    }()
    //MARK: ADS_MODE_CELL
    let adsModeSwitchCell = {
        let cell = UIView()
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        return cell
    }()
    //MARK: DARK_MODE_LABEL
    let darkModeLabel = {
        let label = UILabel()
        label.text = "Қараңғы режим"
        label.font = UIFont(name:"SFProDisplay-Medium", size: 16)
        label.textColor = UIColor(named:"111827 - FFFFFF")
     
        return label
    }()
    //MARK: DARK_MODE_SWITCH
    lazy var darkModeSwitch = {
        let dMSwitch = UISwitch()
        
        dMSwitch.onTintColor = UIColor(red: 0.702, green: 0.463, blue: 0.969, alpha: 1)
        dMSwitch.thumbTintColor = UIColor(red: 0.9, green: 0.91, blue: 0.92, alpha: 1)
        dMSwitch.addTarget(self, action: #selector(changeDarkModeSwitch), for: .touchUpInside)
        
        return dMSwitch
    }()
    //MARK: VIEW_DID_LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        //navigationItem.title = "Профиль"
        setUpUI()
    }
    //MARK: VIEW_DID_APPEAR
    override func viewDidAppear(_ animated: Bool) {
        localizeLanguage()
    }
    //MARK: LOCOLIZE_LANGUAGE
    func localizeLanguage() {
        profileLabel.text = "PROFILE".localized()
        myProfileLabel.text = "MY_PROFILE_LABEL".localized()
        personalDataButton.setTitle("PERSONAL_DATA".localized(), for: .normal)
        changePasswordButton.setTitle("CHENGE_PASSWORD".localized(), for: .normal)
        personalDataButtonLabel.text = "RULE".localized()
        languageButton.setTitle("LANGUAGE".localized(), for: .normal)
        termsAndConditionButton.setTitle("TERMS_AND_CONDITIONS".localized(), for: .normal)
        adsLabel.text = "ADS".localized()
        darkModeLabel.text = "DARK_MODE".localized()
   
        
        if Localize.currentLanguage() == "ru" {
            languageLabel.text = "Русский"
        }
        if Localize.currentLanguage() == "kk" {
            languageLabel.text = "Қазақша"
        }
        if Localize.currentLanguage() == "en" {
            languageLabel.text = "English"
        }
    }
    //MARK: LANGUAGE_DID_CHANNDGE
    func languageDidChande() {
        localizeLanguage()
    }
    //MARK: LOG_OUT_BUTTON_TOPPED
    @objc func logoutButtonTopped() {
        let logOutVC = LogOutViewController()
        
        logOutVC.modalPresentationStyle = .overFullScreen
        self.present(logOutVC, animated: true, completion: nil)
    }
    //MARK: PERSONAL_DATA_BUTTON_TOPPED
    @objc func personalDataButtonTopped() {
        let userInfoVC = UserInfoViewController()
        
        userInfoVC.modalPresentationStyle = .fullScreen
        navigationController?.show(userInfoVC, sender: self)
        // спросить как добавить картинку назад вместо стандартный
        navigationItem.title = ""
    }
    //MARK: CHANGE_PASSWORD_BUTTTON_TOPPED
    @objc func changePasswordButtonTopped() {
        let userInfoVC = ChangePasswordViewController()
        
        userInfoVC.modalPresentationStyle = .fullScreen
        navigationController?.show(userInfoVC, sender: self)
        navigationItem.title = ""
        
    }
    //MARK: LANGUAGE_BUTTON_TOPPED
    @objc func languageButtonTopped() {
        let languageVC = LanguageViewController()
        
        languageVC.modalPresentationStyle = .overFullScreen
        
        languageVC.delegate = self
        
        present(languageVC, animated: true, completion: nil)
    }
    //MARK: TERMS_AND_CONDITION_BUTTON_TOPPED
    @objc func termsAndConditionButtonTopped() {
        
    }
    //MARK: ADS_BUTTON_TOPPED
    @objc func adsButtonTopped() {
       
    }
    //MARK: CHANGE_SWITCH
    @objc func changeSwitch() {
        
    }
    //MARK: CHANGE_DARK_MODE_SWITCH
    @objc func changeDarkModeSwitch() {
        print("You topeed button")
    }
    //MARK: SET_UP_UI
    func setUpUI() {
        view.addSubview(profileLabel)
        view.addSubview(profileImageView)
        view.addSubview(profileCellView)
        view.addSubview(myProfileLabel)
        view.addSubview(emailLabel)
        view.addSubview(backView)
        backView.addSubview(personalDataButton)
        backView.addSubview(personalDataButtonCell)
        backView.addSubview(personalDataButtonLabel)
        backView.addSubview(arrowImage)
        backView.addSubview(changePasswordButton)
        backView.addSubview(arrowImageChangePassswordButton)
        backView.addSubview(changePasswordButtonCell)
        backView.addSubview(languageButton)
        backView.addSubview(languageLabel)
        backView.addSubview(arrowImageLanguageButton)
        backView.addSubview(TermsAndConditionsCell)
        backView.addSubview(termsAndConditionButton)
        backView.addSubview(arrowIamgeTermsAndConditionButton)
        backView.addSubview(adsButtonCell)
        backView.addSubview(adsLabel)
        backView.addSubview(adsModeSwitch)
        backView.addSubview(adsModeSwitchCell)
        backView.addSubview(darkModeLabel)
        backView.addSubview(darkModeSwitch)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logOut"), style: .done, target: self, action: #selector(logoutButtonTopped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 1, green: 0.25, blue: 0.17, alpha: 1)
 
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.centerX.equalToSuperview()
        }
        profileCellView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(19)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileCellView.snp.bottom).offset(24)
        }
        myProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(myProfileLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        backView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(24)
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        personalDataButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(24)
            make.height.equalTo(64)
        }
        personalDataButtonCell.snp.makeConstraints { make in
            make.top.equalTo(personalDataButton.snp.bottom).offset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        personalDataButtonLabel.snp.makeConstraints { make in
            make.centerY.equalTo(personalDataButton)
            make.right.equalTo(arrowImage.snp.left).offset(-8)
        }
        arrowImage.snp.makeConstraints { make in
            make.centerY.equalTo(personalDataButton)
            make.right.equalToSuperview().inset(24)
        }
        changePasswordButton.snp.makeConstraints { make in
            make.top.equalTo(personalDataButtonCell.snp.bottom)
            make.horizontalEdges.equalTo(24)
            make.height.equalTo(64)
        }
        arrowImageChangePassswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(changePasswordButton)
            make.right.equalToSuperview().inset(24)
        }
        changePasswordButtonCell.snp.makeConstraints { make in
            make.top.equalTo(changePasswordButton.snp.bottom).inset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(changePasswordButtonCell.snp.bottom).offset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        arrowImageLanguageButton.snp.makeConstraints { make in
            make.centerY.equalTo(languageButton)
            make.right.equalToSuperview().inset(24)
        }
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(languageButton)
            make.right.equalTo(arrowImage.snp.left).offset(-8)
        }
        TermsAndConditionsCell.snp.makeConstraints { make in
            make.top.equalTo(languageButton.snp.bottom).inset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        termsAndConditionButton.snp.makeConstraints { make in
            make.top.equalTo(TermsAndConditionsCell.snp.bottom).offset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        arrowIamgeTermsAndConditionButton.snp.makeConstraints { make in
            make.centerY.equalTo(termsAndConditionButton)
            make.right.equalToSuperview().inset(24)
        }
        adsButtonCell.snp.makeConstraints { make in
            make.top.equalTo(termsAndConditionButton.snp.bottom).offset(1)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        adsLabel.snp.makeConstraints { make in
            make.top.equalTo(adsButtonCell.snp.bottom).offset(1)
            make.horizontalEdges.equalToSuperview().offset(24)
            make.height.equalTo(64)
        }
        adsModeSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(adsLabel)
            make.right.equalToSuperview().inset(24)
        }
        adsModeSwitchCell.snp.makeConstraints { make in
            make.bottom.equalTo(adsModeSwitch).offset(23)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        darkModeLabel.snp.makeConstraints { make in
            make.top.equalTo(adsModeSwitchCell.snp.bottom).offset(25)
            make.left.equalToSuperview().inset(24)
        }
        darkModeSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(darkModeLabel)
            make.right.equalToSuperview().inset(24)
        }
    }
}
