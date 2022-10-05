//
//  MenuScreenViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Экран выбора блюда
final class MenuScreenViewController: UIViewController {
       
    // MARK: - private properties
    
    private var pizzaLabel = UILabel()
    private var sooshiLabel = UILabel()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        configNavBar()
        setGesterRecognaizer()
    }
    
    // MARK: - private func
    
    private func configNavBar() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8721810567, green: 0.8721810567, blue: 0.8721810567, alpha: 1)
        title = " Food "
    }
    
    private func configViews() {
        pizzaLabel = UILabel(frame: CGRect(
            x: 0,
            y: view.center.y - 200,
            width: view.frame.width - 50,
            height: view.frame.height / 5
        ))
        pizzaLabel.center.x = view.center.x
        pizzaLabel.layer.borderWidth = 1
        pizzaLabel.textAlignment = .center
        pizzaLabel.layer.borderColor = UIColor.black.cgColor
        pizzaLabel.text = " Pizza "
        view.addSubview(pizzaLabel)
        
        sooshiLabel = UILabel(frame: CGRect(
            x: pizzaLabel.frame.origin.x,
            y: pizzaLabel.frame.origin.y + pizzaLabel.frame.height + 20,
            width: pizzaLabel.frame.width,
            height: pizzaLabel.frame.height
        ))
        sooshiLabel.center.x = view.center.x
        sooshiLabel.layer.borderWidth = 1
        sooshiLabel.textAlignment = .center
        sooshiLabel.layer.borderColor = UIColor.black.cgColor
        sooshiLabel.text = " Sooshi "
        view.addSubview(sooshiLabel)
    }
    
    private func setGesterRecognaizer() {
        let recognaizer = UITapGestureRecognizer(target: self, action: #selector(goToPizzaListScreenAction))
        pizzaLabel.isUserInteractionEnabled = true
        pizzaLabel.addGestureRecognizer(recognaizer)
    }
    
    // MARK: - @objc func
    
    @objc private func goToPizzaListScreenAction() {
        let pizzaSreen = SortOfPizzaViewController()
        navigationController?.pushViewController(pizzaSreen, animated: false)
    }
}
