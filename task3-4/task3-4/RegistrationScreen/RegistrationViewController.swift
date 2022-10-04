//
//  RegistrationViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 04.10.2022.
//

import UIKit

/// Экран регистрации нового пользователя
final class RegistrationViewController: UIViewController {

    // MARK: - private IBOulets

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var familyTextField: UITextField!

    // MARK: - private properties

    private let defaults = UserDefaults.standard

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegate()
        addKeyboardNotification()
    }

    // MARK: - IBActions

    @IBAction private func registrationButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              !login.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty,
              let name = nameTextField.text,
              !name.isEmpty,
              let family = familyTextField.text,
              !family.isEmpty else { return }

        defaults.set(login, forKey: UserDefaultsKeys.loginKey)
        defaults.set(password, forKey: UserDefaultsKeys.loginKey)
        defaults.set(name, forKey: UserDefaultsKeys.loginKey)
        defaults.set(family, forKey: UserDefaultsKeys.loginKey)
        defaults.set(true, forKey: UserDefaultsKeys.isUserAuthorizationKey)
    }

    // MARK: - private funcs

    private func addDelegate() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        nameTextField.delegate = self
        familyTextField.delegate = self
    }

    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil, queue: nil
        ) { _ in
            self.view.frame.origin.y = -100
        }

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: nil
        ) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
}

// Добавляет методы делегата UITextField
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            nameTextField.becomeFirstResponder()
        case nameTextField:
            familyTextField.becomeFirstResponder()
        case familyTextField:
            familyTextField.resignFirstResponder()
        default:
            print("unkown result")
        }
        return true
    }
}
