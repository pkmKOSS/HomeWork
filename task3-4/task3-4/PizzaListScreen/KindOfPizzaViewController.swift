//
//  MenuScreenViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Экран выбора ингредиентов.
final class SortOfPizzaViewController: UIViewController {
    
    // MARK: - private properties
    
    private var margaritaImageView = UIImageView()
    private var margaritaLabel = UILabel()
    private var margaritaIngredientsButton = UIButton()
    
    private var peperoniImageView = UIImageView()
    private var peperoniLabel = UILabel()
    private var peperoniIngredientsButton = UIButton()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configMargaritaViews()
        configPeperonyViews()
    }
    
    // MARK: - private funcs
    
    private func configNavBar() {
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8721810567, green: 0.8721810567, blue: 0.8721810567, alpha: 1)
        title = " Food "
    }
    
    private func configMargaritaViews() {
        margaritaImageView = UIImageView(frame: CGRect(
            x: view.frame.origin.x + 25,
            y: view.center.y - 200,
            width: 100,
            height: 100
        ))
        margaritaImageView.image = UIImage(named: "pizzaOne")
        view.addSubview(margaritaImageView)
        
        margaritaLabel = UILabel(frame: CGRect(
            x: margaritaImageView.frame.origin.x + margaritaImageView.frame.width + 20,
            y: 0,
            width: 130,
            height: 30
        ))
        margaritaLabel.center.y = margaritaImageView.center.y
        margaritaLabel.text = " Маргарита "
        margaritaLabel.textColor = .black
        margaritaLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(margaritaLabel)
        
        margaritaIngredientsButton = UIButton(frame: CGRect(
            x: margaritaLabel.frame.origin.x + margaritaLabel.frame.width + 20,
            y: 0,
            width: 30,
            height: 30)
        )
        margaritaIngredientsButton.center.y = margaritaLabel.center.y
        margaritaIngredientsButton.backgroundColor = .systemOrange
        margaritaIngredientsButton.clipsToBounds = true
        margaritaIngredientsButton.layer.cornerRadius = 10
        margaritaIngredientsButton.setImage(UIImage(systemName: "plus"), for: .normal)
        margaritaIngredientsButton.tintColor = .white
        margaritaIngredientsButton.addTarget(
            self,
            action: #selector(goToMargaritaIngredientsScreenAction),
            for: .touchUpInside
        )
        view.addSubview(margaritaIngredientsButton)
    }
    
    private func configPeperonyViews() {
        peperoniImageView = UIImageView(frame: CGRect(
            x: view.frame.origin.x + 25,
            y: margaritaImageView.frame.origin.y + margaritaImageView.frame.height + 20,
            width: 100,
            height: 100
        ))
        peperoniImageView.image = UIImage(named: "pizzaTwo")
        view.addSubview(peperoniImageView)
        
        peperoniLabel = UILabel(frame: CGRect(
            x: peperoniImageView.frame.origin.x + peperoniImageView.frame.width + 20,
            y: 0,
            width: 130,
            height: 30
        ))
        peperoniLabel.center.y = peperoniImageView.center.y
        peperoniLabel.text = " Пеперони "
        peperoniLabel.textColor = .black
        peperoniLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(peperoniLabel)
        
        peperoniIngredientsButton = UIButton(frame: CGRect(
            x: peperoniLabel.frame.origin.x + peperoniLabel.frame.width + 20,
            y: 0,
            width: 30,
            height: 30)
        )
        peperoniIngredientsButton.center.y = peperoniLabel.center.y
        peperoniIngredientsButton.backgroundColor = .systemOrange
        peperoniIngredientsButton.clipsToBounds = true
        peperoniIngredientsButton.layer.cornerRadius = 10
        peperoniIngredientsButton.setImage(UIImage(systemName: "plus"), for: .normal)
        peperoniIngredientsButton.tintColor = .white
        peperoniIngredientsButton.addTarget(
            self,
            action: #selector(goToPeperoniIngredientsScreenAction),
            for: .touchUpInside
        )
        view.addSubview(peperoniIngredientsButton)
    }
    
    // MARK: - @objc funcs
    
    @objc private func goToMargaritaIngredientsScreenAction() {
        let ingredientScreen = IngredientsViewController()
        ingredientScreen.selectedPizza = Pizza(
            pizzaName: " Маргарита ",
            pizzaImageName: "pizzaOne")
        ingredientScreen.modalPresentationStyle = .formSheet
        navigationController?.present(ingredientScreen, animated: false)
    }
    
    @objc private func goToPeperoniIngredientsScreenAction() {
        let ingredientScreen = IngredientsViewController()
        ingredientScreen.modalPresentationStyle = .formSheet
        ingredientScreen.selectedPizza = Pizza(pizzaName: " Пеперони ", pizzaImageName: "pizzaTwo")
        navigationController?.present(ingredientScreen, animated: false)
    }
}
