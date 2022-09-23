//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Контроллер главной сцены.
class MainViewController: UIViewController {
    
    // MARK: - private properties
    
    private var sumButton: UIButton = UIButton()
    private var guessNumberGameButton: UIButton = UIButton()
    private var labelWithName: UILabel = UILabel()
    private var helloAlert: UIAlertController = UIAlertController()
    private var sumAlert: UIAlertController = UIAlertController()
    private var resultOfSumAlert: UIAlertController = UIAlertController()
    private var guessGameAlert: UIAlertController = UIAlertController()
    private var resultOfGuessGameAlert: UIAlertController = UIAlertController()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHelloAlert()
        configGuessGameAlert()
        configResultOfGuessGameAlert()
        configSumAlert()
        configResultOfSumAlert()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(helloAlert, animated: true)
    }
    
    // MARK: - private func
    
    private func configViews() {
        labelWithName = UILabel(frame: CGRect(
            x: view.center.x,
            y: +50,
            width: 300,
            height: 50)
        )
        labelWithName.center.x = view.center.x
        
        sumButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: +125,
            width: 300,
            height: 50)
        )
        sumButton.center.x = view.center.x

        guessNumberGameButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: +175,
            width: 300,
            height: 50)
        )
        guessNumberGameButton.center.x = view.center.x
        
        sumButton.setTitle(" Сложение ", for: .normal)
        sumButton.backgroundColor = .red
        sumButton.addTarget(self, action: #selector(openSumAlertAction), for: .touchUpInside)
       
        guessNumberGameButton.setTitle(" Угадай число ", for: .normal)
        guessNumberGameButton.backgroundColor = .systemBlue
        guessNumberGameButton.addTarget(self, action: #selector(openGuessNumberAlertAction), for: .touchUpInside)
        
        labelWithName.textColor = .black
        
        view.addSubview(sumButton)
        view.addSubview(guessNumberGameButton)
        view.addSubview(labelWithName)
    }
    
    private func configHelloAlert() {
        helloAlert = UIAlertController(title: " Добрый день! ",
                                       message: " Введите ваше имя и фамилию! ",
                                       preferredStyle: .alert)
        
        helloAlert.addTextField()
        helloAlert.addAction(UIAlertAction(title: " Ок ",
                                           style: .default,
                                           handler: { _ in
            self.labelWithName.text = self.helloAlert.textFields?.first?.text
        })
        )
    }
    
    private func configGuessGameAlert() {
        guessGameAlert = UIAlertController(title: " Угадай число! ",
                                           message: " Введите любое число от 0 до 100 ",
                                           preferredStyle: .alert)
        
        guessGameAlert.addTextField()
        guessGameAlert.addAction(UIAlertAction(title: " Попытать удачу! ",
                                               style: .default, handler: { _ in
            let randomNumber = Int.random(in: 0...100)
            if randomNumber == Int(self.guessGameAlert.textFields?.first?.text ?? "") ?? 101 {
                self.resultOfGuessGameAlert.message = " Ура! Ты угадал! "
                self.present(self.resultOfGuessGameAlert, animated: true)
            } else {
                self.resultOfGuessGameAlert.message = " Попробуй еще "
                self.present(self.resultOfGuessGameAlert, animated: true)
                self.guessGameAlert.textFields?.first?.text?.removeAll()
            }
        }))
    }
    
    private func configResultOfGuessGameAlert() {
        resultOfSumAlert = UIAlertController(title: " Готово! ",
                                             message: nil,
                                             preferredStyle: .alert)
        
        resultOfGuessGameAlert.addAction(UIAlertAction(title: " Попробовать еще ", style: .default))
    }
    
    private func configSumAlert() {
        sumAlert = UIAlertController(title: " Введите числа ", message: nil, preferredStyle: .alert)
        sumAlert.addTextField()
        sumAlert.addTextField()
        sumAlert.addAction(UIAlertAction(title: " Сложить ", style: .default, handler: { [self] _ in
            let textfields = self.sumAlert.textFields
            let sum = (Int(textfields?.first?.text ?? "") ?? 0)  + (Int(textfields?.last?.text ?? "") ?? 0)
            resultOfSumAlert.message = " Результат сложения = \(sum) "
            present(resultOfSumAlert, animated: true)
        }))
    }
    
    private func configResultOfSumAlert() {
        resultOfSumAlert = UIAlertController(title: " Готово! ",
                                             message: nil,
                                             preferredStyle: .alert)
        
        resultOfSumAlert.addAction(UIAlertAction(title: " Ok ", style: .cancel))
    }
    
    // MARK: - @objc funcs
    
    @objc func openSumAlertAction() {
        present(sumAlert, animated: true)
    }
    
    @objc func openGuessNumberAlertAction() {
        present(guessGameAlert, animated: true)
    }
}
