//
//  IngredientsViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Экран выбора ингредиентов для пиццы
final class IngredientsViewController: UIViewController {
    
    // MARK: - visual components
    
    private var pizzaNameHeadLabel = UILabel()
    private var pizzaImageView = UIImageView()
    private var makeOrderButton = UIButton()
    private var cheezeIngredient: IngredientView?
    private var hamIngredient: IngredientView?
    private var mashroomsIngredient: IngredientView?
    private var olivesIngredient: IngredientView?
    
    // MARK: - public properties
    
    var selectedPizza: Pizza?
    
    // MARK: - private properties
    
    private var menuScreenViewController = SortOfPizzaViewController()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateViews()
    }
    
    // MARK: - private func
    
    private func configuratePizzaNameHeadLabel() {
        pizzaNameHeadLabel = UILabel(frame: CGRect(
            x: 0,
            y: view.frame.origin.y + 50,
            width: 130,
            height: 30
        ))
        pizzaNameHeadLabel.center.x = view.center.x
        pizzaNameHeadLabel.textAlignment = .center
        pizzaNameHeadLabel.text = selectedPizza?.pizzaName
        pizzaNameHeadLabel.textColor = .black
        pizzaNameHeadLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(pizzaNameHeadLabel)
    }
    
    private func configuratePizzaImageView() {
        pizzaImageView = UIImageView(frame: CGRect(
            x: view.frame.origin.x + 5,
            y: pizzaNameHeadLabel.frame.origin.y + pizzaNameHeadLabel.frame.height + 10,
            width: 250,
            height: 250
        ))
        pizzaImageView.center.x = pizzaNameHeadLabel.center.x
        pizzaImageView.image = UIImage(named: selectedPizza?.pizzaImageName ?? "pizzaThree")
        view.addSubview(pizzaImageView)
    }
    
    private func configurateCheezeIngredient() {
        cheezeIngredient = IngredientView(ingredientLabelText: "Сыр мацарела", frame: CGRect(
            x: 0,
            y: pizzaImageView.frame.origin.y + pizzaImageView.frame.height + 10,
            width: view.frame.width - 50,
            height: view.frame.height / 13
        ))
        
        guard let view = cheezeIngredient else { return }
        
        view.center.x = view.center.x
        view.actionHandler = { [self] state in
            self.selectedPizza?.cheeze = state
        }
        view.addSubview(view)
    }
    
    private func configurateHamIngredient() {
        guard let cheezeView = cheezeIngredient else { return }
        
        hamIngredient = IngredientView(ingredientLabelText: "Ветчина", frame: CGRect(
            x: 0,
            y: cheezeView.frame.origin.y + cheezeView.frame.height + 10,
            width: view.frame.width - 50,
            height: view.frame.height / 13
        ))
        
        guard let hamView = hamIngredient else { return }

        hamView.center.x = view.center.x
        hamView.actionHandler = { [self] state in
            self.selectedPizza?.hum = state
        }
        view.addSubview(hamView)
    }
    
    private func configurateMashroomsIngredient() {
        guard let hamView = hamIngredient else { return }
        mashroomsIngredient = IngredientView(ingredientLabelText: "Грибы", frame: CGRect(
            x: 0,
            y: hamView.frame.origin.y + hamView.frame.height + 10,
            width: view.frame.width - 50,
            height: view.frame.height / 13
        ))
        guard let mashroomView = mashroomsIngredient else { return }
        
        mashroomView.center.x = view.center.x
        mashroomView.actionHandler = { [self] state in
            self.selectedPizza?.mashrooms = state
        }
        view.addSubview(mashroomView)
    }
    
    private func configurateOlivesIngredient() {
        guard let mashroomView = mashroomsIngredient else { return }
        olivesIngredient = IngredientView(ingredientLabelText: "Маслины", frame: CGRect(
            x: 0,
            y: mashroomView.frame.origin.y + mashroomView.frame.height + 10,
            width: view.frame.width - 50,
            height: view.frame.height / 13
        ))
        guard let olivesView = olivesIngredient else { return }
        olivesView.center.x = view.center.x
        olivesView.actionHandler = { [self] state in
            self.selectedPizza?.olives = state
        }
        view.addSubview(olivesView)
    }
    
    private func configurateOrderButton() {
        guard let olivesView = olivesIngredient else { return }
        makeOrderButton = UIButton(frame: CGRect(
            x: 0,
            y: olivesView.frame.origin.y + olivesView.frame.height + 10,
            width: 100,
            height: 30)
        )
        makeOrderButton.center.x = view.center.x
        makeOrderButton.backgroundColor = .systemBlue
        makeOrderButton.setTitle(" Выбрать ", for: .normal)
        makeOrderButton.addTarget(self, action: #selector(goToPaymentScreenAction), for: .touchUpInside)
        view.addSubview(makeOrderButton)
    }
    
    private func configurateViews() {
        view.backgroundColor = .white
        configuratePizzaNameHeadLabel()
        configuratePizzaImageView()
        configurateCheezeIngredient()
        configurateHamIngredient()
        configurateMashroomsIngredient()
        configurateOlivesIngredient()
        configurateOrderButton()
    }
    
    // MARK: - @objc funcs
    
    @objc func goToPaymentScreenAction() {
        let paymentScreen = PayementViewController()
        paymentScreen.pizza = selectedPizza
        let navController = UINavigationController(rootViewController: paymentScreen)
        paymentScreen.delegate = self
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

/// Требует метод возрата к корневому контроллеру.
protocol PopToRootDelegate: AnyObject {
    func goToBack()
}

// Расширяем класс для возможности возврата к корневому контроллеру.
extension IngredientsViewController: PopToRootDelegate {
    func goToBack() {
        if let vc = self.presentingViewController as? UINavigationController {
            dismiss(animated: false)
            vc.popToRootViewController(animated: false)
        }
    }
}
