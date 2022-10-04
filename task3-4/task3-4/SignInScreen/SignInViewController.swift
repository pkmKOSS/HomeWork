//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Экран входа в приложение
final class SignInViewController: UIViewController {

    // MARK: - visual components

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    // MARK: - private properties

    private let defaults = UserDefaults.standard

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        goToUserStoryScreen()
    }

    // MARK: - IBActions

    @IBAction private func enterButtonAction(_ sender: Any) {
        guard let user = defaults.value(forKey: UserDefaultsKeys.loginKey),
              (user as? String) == loginTextField.text,
              let userPassword = defaults.value(forKey: UserDefaultsKeys.passwordKey),
              userPassword as? String == passwordTextField.text else { return }
        performSegue(withIdentifier: "userStory", sender: nil)
    }

    @IBAction private func registrationButtonAction(_ sender: Any) {
    }

    // MARK: - private funcs

    private func isUserAuthorizated() -> Bool {
        guard let isUserSignIn = defaults.value(forKey: UserDefaultsKeys.isUserAuthorizationKey) as? Bool,
              isUserSignIn == true else { return false }
        return isUserSignIn
    }

    private func goToUserStoryScreen() {
        guard isUserAuthorizated() == true else { return }
        performSegue(withIdentifier: "userStory", sender: nil)
    }
}
