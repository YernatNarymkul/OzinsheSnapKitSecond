//
//  LogOutViewController.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 05/02/2024.
//

import UIKit
import SnapKit

class LogOutViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    //MARK: backView
    let backView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.opacity = 1
        return view
    }()
    //MARK: homeView
    let homeView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        view.layer.cornerRadius = 3
        return view
    }()
    //MARK: logOutLabel
    let logOutLabel = {
        let label = UILabel()
        label.text = "Шығу"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "111827 - FFFFFF")
        return label
    }()
    //MARK: questionLabel
    let questionLabel = {
        let label = UILabel()
        label.text = "Сіз шынымен аккаунтыңыздан шығасыз ба?"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        return label
    }()
    //MARK: agreeButton
    lazy var agreeButton = {
        let button = UIButton()
        button.setTitle("Иә, шығу", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()
    //MARK: disagreeButton
    lazy var disagreeButton = {
        let button = UIButton()
        button.setTitle("Жоқ", for: .normal)
        button.setTitleColor(UIColor(red: 0.329, green: 0.082, blue: 0.776, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tapGest()
        localizeLanguage()
    }
    //MARK: setupUI
    func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

        view.addSubview(backView)
        backView.addSubview(homeView)
        backView.addSubview(logOutLabel)
        backView.addSubview(questionLabel)
        backView.addSubview(agreeButton)
        backView.addSubview(disagreeButton)
        
        backView.snp.makeConstraints { make in
            make.height.equalTo(303)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.size.equalTo(CGSize(width: 64, height: 5))
            make.centerX.equalToSuperview()
        }
        
        logOutLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.left.equalToSuperview().inset(24)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(logOutLabel.snp.bottom).offset(8)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        disagreeButton.snp.makeConstraints { make in
            make.top.equalTo(agreeButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    //MARK: localizeLanguage
    func localizeLanguage() {
//        logOutLabel.text = "LOG_OUT_LABEL".localized()
//        questionLabel.text = "LOG_OUT_QUES_LABEL".localized()
//        agreeButton.setTitle("LOG_OUT_BUTTON".localized(), for: .normal)
//        disagreeButton.setTitle("NO_LOG_OUT_BUTTON".localized(), for: .normal)
    }
    //MARK: tapGest
    func tapGest() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    //MARK: dismissView
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: handleDismiss
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.backView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.backView.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    //MARK: logoutButtonTapped
    @objc func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        
        DispatchQueue.main.async {
//               let rootVC = UINavigationController(rootViewController: SignInViewController())
               
//               let appDelegate = UIApplication.shared.delegate as! AppDelegate
//               appDelegate.window?.rootViewController = rootVC
//               appDelegate.window?.makeKeyAndVisible()
           }
    }
    //MARK: gestureRecognizer
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backView))! {
            return false
        }
        return true
    }
    //MARK: cancelButtonTapped
    @objc func cancelButtonTapped() {
        dismissView()
    }
}
