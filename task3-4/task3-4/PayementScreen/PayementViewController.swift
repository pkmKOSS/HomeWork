//
//  PayementViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Экран оплаты заказа
final class PayementViewController: UIViewController {
    
    // MARK: - visual components
    
    private var yourOrderLabel = UILabel()
    private var ingredientNumberOneLabel = UILabel()
    private var ingredientNumberTwoLabel = UILabel()
    private var ingredientNumberThreeLabel = UILabel()
    private var ingredientNumberFourLabel = UILabel()
    private var cardPayLabel = UILabel()
    private var cashPayLabel = UILabel()
    private var cardPaySwitch = UISwitch()
    private var cashPaySwitch = UISwitch()
    private var applePayButton = UIButton()
    
    // MARK: - public properties
    
    var pizza: Pizza?
    
    // MARK: - private properties
    
    var ingredientCounter = 1
    
    // MARK: - Delegate
    
    weak var delegate: PopToRootDelegate?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateSuperView()
        configureYourOrderLabel()
        configurateIngredientLabel()
        configuratePaymentsLabel()
        configuratePayementsSwitch()
        configurateApplePayButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showRandomEvaluate()
    }
    
    // MARK: - private funcs
    
    private func configurateSuperView() {
        view.backgroundColor = .white
        title = " Оплата "
        navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
    private func configureYourOrderLabel() {
        yourOrderLabel = UILabel(frame: CGRect(
            x: 25,
            y: view.frame.origin.y + 150,
            width: 330,
            height: 30
        ))
        yourOrderLabel.textAlignment = .left
        yourOrderLabel.textColor = .black
        yourOrderLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        guard let orderedPizza = pizza else {
            yourOrderLabel.text = " Пицца не заказана "
            ingredientNumberOneLabel.isHidden = true
            return }
        
        yourOrderLabel.text = " Ваш заказ: пицца \(orderedPizza.pizzaName)"
        view.addSubview(yourOrderLabel)
    }
    
    private func configurateIngredientLabel() {
        
        ingredientNumberOneLabel = UILabel(frame: CGRect(
            x: 25,
            y: yourOrderLabel.frame.origin.y + yourOrderLabel.frame.height + 30,
            width: 430,
            height: 100
        ))
        ingredientNumberOneLabel.textAlignment = .left
        ingredientNumberOneLabel.numberOfLines = 0
        ingredientNumberOneLabel.textColor = .black
        ingredientNumberOneLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        configureStringWithOptionsOfOrder()
        
        view.addSubview(ingredientNumberOneLabel)
    }
    
    private func configureStringWithOptionsOfOrder() {
        if pizza?.hum != false {
            ingredientNumberOneLabel.text = "\(ingredientCounter). Ветчина"
            ingredientCounter += 1
        }
        
        if pizza?.mashrooms != false {
            var text = ingredientNumberOneLabel.text ?? ""
            text += "\n\(ingredientCounter). Грибы"
            ingredientNumberOneLabel.text = text
            ingredientCounter += 1
        }
        
        if pizza?.cheeze != false {
            var text = ingredientNumberOneLabel.text ?? ""
            text += "\n\(ingredientCounter). Сыр Мацарелла"
            ingredientNumberOneLabel.text = text
            ingredientCounter += 1
        }
        
        if pizza?.olives != false {
            var text = ingredientNumberOneLabel.text ?? ""
            text += "\n\(ingredientCounter). Маслины"
            ingredientNumberOneLabel.text = text
        }
    }
    
    private func configuratePaymentsLabel() {
        cardPayLabel = UILabel(frame: CGRect(
            x: 25,
            y: view.frame.height * 0.70,
            width: 230,
            height: 30
        ))
        cardPayLabel.textAlignment = .left
        cardPayLabel.text = "Оплата картой"
        cardPayLabel.textColor = .black
        cardPayLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(cardPayLabel)
        
        cashPayLabel = UILabel(frame: CGRect(
            x: 25,
            y: cardPayLabel.frame.origin.y + cardPayLabel.frame.height + 10,
            width: 230,
            height: 30
        ))
        cashPayLabel.textAlignment = .left
        cashPayLabel.text = "Оплата наличными"
        cashPayLabel.textColor = .black
        cashPayLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(cashPayLabel)
    }
    
    private func configuratePayementsSwitch() {
        cardPaySwitch = UISwitch(frame: CGRect(
            x: cardPayLabel.frame.origin.x + cardPayLabel.frame.width + 30,
            y: view.frame.height * 0.70,
            width: 130,
            height: 30
        ))
        cardPaySwitch.addTarget(self, action: #selector(disenableCashPaymentsSwitchAction), for: .allEvents)
        view.addSubview(cardPaySwitch)
        
        cashPaySwitch = UISwitch(frame: CGRect(
            x: cardPaySwitch.frame.origin.x,
            y: cardPaySwitch.frame.origin.y + cardPaySwitch.frame.height + 10,
            width: 130,
            height: 30
        ))
        cashPaySwitch.addTarget(self, action: #selector(disenableCardPaymentsSwitchAction), for: .allEvents)
        view.addSubview(cashPaySwitch)
    }
    
    private func configurateApplePayButton() {
        applePayButton = UIButton(frame: CGRect(
            x: 0,
            y: cashPayLabel.frame.origin.y + cashPayLabel.frame.height + 30,
            width: 300,
            height: 60)
        )
        applePayButton.center.x = view.center.x
        applePayButton.backgroundColor = .black
        applePayButton.clipsToBounds = true
        applePayButton.layer.cornerRadius = 10
        applePayButton.setTitle(" Оплатить ", for: .normal)
        applePayButton.addTarget(self, action: #selector(payAction), for: .touchUpInside)
        view.addSubview(applePayButton)
    }
    
    private func showRandomEvaluate() {
        let randomNumber = Int.random(in: 1...3)
        if randomNumber == 1 {
            let evaluateScreen = EvaluateViewController()
            present(evaluateScreen, animated: false)
        }
    }
    
    // MARK: - @objc func
    
    @objc func disenableCashPaymentsSwitchAction() {
        cashPaySwitch.isOn = false
    }
    
    @objc func disenableCardPaymentsSwitchAction() {
        cardPaySwitch.isOn = false
    }
}

// Добавляет алерт уведомление о статусе заказа и методом возвращающим на экран меню.
extension PayementViewController {
    @objc func payAction() {
        let alert = UIAlertController(
            title: "Статус заказа.",
            message: "Ваш заказ успешно оплачен!",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goToBack()
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
