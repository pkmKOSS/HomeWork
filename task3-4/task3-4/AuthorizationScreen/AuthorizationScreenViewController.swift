//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Контроллер экрана авторизации.
class AuthorizationScreenViewController: UIViewController {
    
    // MARK: - private properties
    private var enterByFaceIDSwitcher = UISwitch()
    
    // MARK: - lige cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    // MARK: - private funcs
    
    private func createViews() {
        
        let headLabel = UILabel.addLabel(
            text: " Birthday reminder ",
            color: .white,
            textAligment: .center,
            height: 75,
            width: 200,
            originX: 0,
            originY: +100
        )
        headLabel.center.x = view.center.x
        headLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        headLabel.layer.borderWidth = 1
        headLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        
        let signInLabel = UILabel.addLabel(
            text: "Sing In",
            color: .white,
            textAligment: .left,
            height: 50,
            width: 150,
            originX: headLabel.frame.origin.x - 40,
            originY: headLabel.frame.origin.y + headLabel.frame.height + 50
        )
        
        signInLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let loginLabel = UILabel.addLabel(
            text: "Email",
            color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            textAligment: .left,
            height: 20,
            width: 300,
            originX: signInLabel.frame.origin.x,
            originY: signInLabel.frame.origin.y + signInLabel.frame.height
        )
        
        loginLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        
        let loginTextfield = UITextField.addTextField(
            placeHolderText: "ExampleEmail@gmail.com",
            color: .black,
            textAligment: .left,
            height: 40,
            width: 300,
            originX: loginLabel.frame.origin.x,
            originY: loginLabel.frame.origin.y + loginLabel.frame.height,
            borderWidth: 1,
            cornerRadius: 5
        )
        
        let firstGrayLine = UIView(frame: CGRect(
            x: loginLabel.frame.origin.x,
            y: loginLabel.frame.origin.y + loginLabel.frame.height + 40,
            width: 300,
            height: 1)
        )
        
        firstGrayLine.backgroundColor = .gray
        
        let passwordLabel = UILabel.addLabel(
            text: "Password ",
            color: .white,
            textAligment: .left,
            height: loginLabel.frame.height,
            width: loginLabel.frame.width,
            originX: firstGrayLine.frame.origin.x,
            originY: firstGrayLine.frame.origin.y + 15)
        
        passwordLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        
        let passwordTextfield = UITextField.addTextField(
            placeHolderText: "1234!GmaiExemplePassword",
            color: .black,
            textAligment: .left,
            height: loginTextfield.frame.height,
            width: loginTextfield.frame.width,
            originX: loginTextfield.frame.origin.x,
            originY: passwordLabel.frame.origin.y + 15,
            borderWidth: 1,
            cornerRadius: 5
        )
        
        passwordTextfield.isSecureTextEntry = true
        
        let secondGrayLine = UIView(frame: CGRect(
            x: passwordTextfield.frame.origin.x,
            y: passwordTextfield.frame.origin.y + passwordTextfield.frame.height,
            width: 300,
            height: 1)
        )
        
        secondGrayLine.backgroundColor = .gray
        
        let faceIDEnterLabel = UILabel.addLabel(
            text: " Вход по Face ID ",
            color: .white,
            textAligment: .center,
            height: 50,
            width: 150,
            originX: 0,
            originY: secondGrayLine.frame.origin.y + 25
        )
        
        faceIDEnterLabel.font = UIFont.systemFont(ofSize: 15)
        
        faceIDEnterLabel.center.x = view.center.x
        
        enterByFaceIDSwitcher = UISwitch(frame: CGRect(
            x: faceIDEnterLabel.frame.origin.x + faceIDEnterLabel.frame.width + 10,
            y: faceIDEnterLabel.frame.origin.y + 10,
            width: 300,
            height: 100)
        )
        
        let enterButton = UIButton.addButton(
            text: " Войти ",
            color: #colorLiteral(red: 0.6803397536, green: 0.7761349082, blue: 0.9662006497, alpha: 1),
            textAligment: .center,
            height: 45,
            width: 300,
            originX: passwordTextfield.frame.origin.x,
            originY: faceIDEnterLabel.frame.origin.y + faceIDEnterLabel.frame.height + 20
        )
        
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        enterButton.layer.cornerRadius = 5
        enterButton.layer.shadowRadius = 4.0
        enterButton.layer.shadowOpacity = 0.6
        enterButton.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        enterButton.addTarget(self, action: #selector(goToBirthdayListCreenAction), for: .touchUpInside)
        
        view.addSubview(headLabel)
        view.addSubview(firstGrayLine)
        view.addSubview(passwordLabel)
        view.addSubview(signInLabel)
        view.addSubview(secondGrayLine)
        view.addSubview(loginLabel)
        view.addSubview(loginTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(faceIDEnterLabel)
        view.addSubview(enterButton)
        view.addSubview(enterByFaceIDSwitcher)
    }
    
    // MARK: - @objc func
    
    @objc private func goToBirthdayListCreenAction() {
        let vc = BirthdayScreenViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
