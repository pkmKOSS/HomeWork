//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// VC главной сцены
class ViewController: UIViewController {
    private var startButton: UIButton = UIButton()
    private var helloLabel: UILabel = UILabel()
    private let transformedWord: TransformedWord = TransformedWord()
    private var inputWordAlert: UIAlertController = UIAlertController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    private func configViews() {
        
        helloLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
        helloLabel.center.x = view.center.x
        
        startButton = UIButton(frame: CGRect(x: 100, y: helloLabel.frame.origin.y + 75, width: 300, height: 50))
        startButton.center.x = view.center.x
        
        helloLabel.backgroundColor = .blue
        helloLabel.textColor = .white
        helloLabel.text = " Тут пока что пусто "
        helloLabel.textAlignment = .center
        
        startButton.setTitle(" Начать ", for: .normal)
        startButton.backgroundColor = .red
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        
        inputWordAlert = UIAlertController(title: " Введите слово ", message: nil, preferredStyle: .alert)
        inputWordAlert.addTextField()
        inputWordAlert.addAction(UIAlertAction(title: " Результат ", style: .default, handler: { [self] _ in
            helloLabel.text = transformedWord.returnHello(self.inputWordAlert.textFields?.first?.text ?? "")
        }))
        
        view.addSubview(startButton)
        view.addSubview(helloLabel)
    }
    
    @objc func startAction() {
        present(inputWordAlert, animated: true)
    }
}
