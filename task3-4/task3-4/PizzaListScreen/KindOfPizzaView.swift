//
//  SortOfPizzaView.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Вью с сортом пиццы
final class KindOfPizzaView: UIView {
    
    // MARK: - private properties
    
    private var pizzaImageView = UIImageView()
    private var pizzaSortLabel = UILabel()
    private var selectIngredientsButton = UIButton()
    private var forPizzaImage: UIImage
    private var pizzaNameText: String
    
    // MARK: - Конструктор
    
    /// Конструктор вью конкретного вида пиццы.
    /// - Parameters:
    ///   - frame: Внешние границы представления.
    ///   - image: Изображение пиццы.
    ///   - pizzaNameText: Название пиццы.
    init(frame: CGRect, image: UIImage, pizzaNameText: String) {
        self.forPizzaImage = image
        self.pizzaNameText = pizzaNameText
        super.init(frame: frame)
        configurateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private funcs
    
    private func configurateViews() {
        pizzaImageView = UIImageView(frame: CGRect(
            x: frame.origin.x + 5,
            y: 15,
            width: 100,
            height: 100
        ))
        pizzaImageView.image = forPizzaImage
        addSubview(pizzaImageView)
        
        pizzaSortLabel = UILabel(frame: CGRect(
            x: pizzaImageView.frame.origin.x + pizzaImageView.frame.width + 20,
            y: 0,
            width: 130,
            height: 30
        ))
        pizzaSortLabel.center.y = pizzaImageView.center.y
        pizzaSortLabel.text = " Маргарита "
        pizzaSortLabel.textColor = .black
        pizzaSortLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(pizzaSortLabel)
        
        selectIngredientsButton = UIButton(frame: CGRect(
            x: pizzaSortLabel.frame.origin.x + pizzaSortLabel.frame.width + 20,
            y: 0,
            width: 30,
            height: 30)
        )
        selectIngredientsButton.center.y = pizzaSortLabel.center.y
        selectIngredientsButton.backgroundColor = .systemOrange
        selectIngredientsButton.clipsToBounds = true
        selectIngredientsButton.layer.cornerRadius = 10
        selectIngredientsButton.setImage(UIImage(systemName: "plus"), for: .normal)
        selectIngredientsButton.tintColor = .white
        addSubview(selectIngredientsButton)
    }
}
