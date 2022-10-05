//
//  authorizationScreenViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Экран авторизации
final class AuthorizationScreenViewController: UIViewController {
    
    // MARK: - private properties
    
    private var cloudImageView = UIImageView()
    private var cloudLabel = UILabel()
    private var loginByPhoneLabel = UILabel()
    private var loginByPhoneTextField = UITextField()
    private var grayLineLowerloginByPhoneView = UIView()
    private var passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private var grayLineLowerPasswordTextFieldView = UIView()
    private var enterButton = UIButton()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCloudViews()
        configLoginViews()
        configPasswordViews()
        configEnterButton()
    }
    
    // MARK: - private funcs
    
    private func configCloudViews() {
        cloudImageView = UIImageView(frame: CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y + 80,
            width: 90,
            height: 70
        )
        )
        cloudImageView.center.x = view.center.x
        cloudImageView.tintColor = #colorLiteral(red: 0.8885301499, green: 0.8885301499, blue: 0.8885301499, alpha: 1)
        cloudImageView.image = UIImage(systemName: "cloud.fill")
        cloudImageView.center.x = view.center.x
        view.addSubview(cloudImageView)
        
        cloudLabel = UILabel(frame: CGRect(
            x: cloudImageView.frame.origin.x,
            y: cloudImageView.frame.origin.y + 30,
            width: 70,
            height: 30
        ))
        cloudLabel.center.x = cloudImageView.center.x + 5
        cloudLabel.textColor = #colorLiteral(red: 0.6558997035, green: 0.7721907496, blue: 0.9746767879, alpha: 1)
        cloudLabel.text = " Pizza "
        cloudLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(cloudLabel)
    }
    
    private func configLoginViews() {
        
        loginByPhoneLabel = UILabel(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: view.center.y - 150,
            width: 100,
            height: 40
        ))
        loginByPhoneLabel.textColor = #colorLiteral(red: 0.6558997035, green: 0.7721907496, blue: 0.9746767879, alpha: 1)
        loginByPhoneLabel.text = "Phone "
        loginByPhoneLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(loginByPhoneLabel)
        
        loginByPhoneTextField = UITextField(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: loginByPhoneLabel.frame.origin.y + loginByPhoneLabel.frame.height + 10,
            width: 200,
            height: 40
        ))
        loginByPhoneTextField.placeholder = "8 800 555 35 35"
        view.addSubview(loginByPhoneTextField)
        
        grayLineLowerloginByPhoneView = UIView(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: loginByPhoneTextField.frame.origin.y + loginByPhoneTextField.frame.height + 10,
            width: 350,
            height: 1)
        )
        
        grayLineLowerloginByPhoneView.backgroundColor = .gray
        view.addSubview(grayLineLowerloginByPhoneView)
    }
    
    private func configPasswordViews() {
        passwordLabel = UILabel(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: grayLineLowerloginByPhoneView.center.y + 10,
            width: 100,
            height: 40
        ))
        
        passwordLabel.textColor = #colorLiteral(red: 0.6558997035, green: 0.7721907496, blue: 0.9746767879, alpha: 1)
        passwordLabel.text = "Password "
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(passwordLabel)
        
        passwordTextField = UITextField(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: passwordLabel.frame.origin.y + passwordLabel.frame.height + 10,
            width: 200,
            height: 40
        ))
        passwordTextField.keyboardType = .numberPad
        passwordTextField.placeholder = " 1234 "
        view.addSubview(passwordTextField)
        
        grayLineLowerPasswordTextFieldView = UIView(frame: CGRect(
            x: view.frame.origin.x + 30,
            y: passwordTextField.frame.origin.y + passwordTextField.frame.height + 10,
            width: 350,
            height: 1)
        )
        
        grayLineLowerPasswordTextFieldView.backgroundColor = .gray
        view.addSubview(grayLineLowerPasswordTextFieldView)
    }
    
    private func configEnterButton() {
        enterButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: grayLineLowerPasswordTextFieldView.frame.origin.y + grayLineLowerPasswordTextFieldView.frame.height + 50,
            width: 300,
            height: 50)
        )
        enterButton.center.x = view.center.x
        enterButton.backgroundColor = #colorLiteral(red: 0.6558997035, green: 0.7721907496, blue: 0.9746767879, alpha: 1)
        enterButton.clipsToBounds = true
        enterButton.layer.cornerRadius = 5
        enterButton.setTitle(" Войти ", for: .normal)
        enterButton.addTarget(self, action: #selector(goToMenuAction), for: .touchUpInside)
        view.addSubview(enterButton)
    }
    
    // MARK: - config @objc func
    
    @objc private  func goToMenuAction() {
        let menuScreenViewController = MenuScreenViewController()
        let navController = UINavigationController(rootViewController: menuScreenViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: false)
    }
}
