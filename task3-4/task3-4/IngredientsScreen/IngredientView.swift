//
//  IngredientView.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 30.09.2022.
//

import UIKit

/// Вью выбора ингредиентов
final class IngredientView: UIView {
    
    // MARK: - Visual components
    
    private var ingredientLabel = UILabel()
    private var ingredientSwitch = UISwitch()
    
    // MARK: - public var
    
    var actionHandler: ((_ handler: Bool) -> ())?
    
    // MARK: - private properties
    
    private var ingredientLabelText: String
    private var switchState = false
    
    // MARK: - Конструктор
    
    init(ingredientLabelText: String, frame: CGRect) {
        self.ingredientLabelText = ingredientLabelText
        super.init(frame: frame)
        configurateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private funcs
    
    private func configurateViews() {
        ingredientLabel = UILabel(frame: CGRect(
            x: 5,
            y: 5,
            width: 200,
            height: 30
        ))
        ingredientLabel.text = ingredientLabelText
        ingredientLabel.textColor = .black
        ingredientLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(ingredientLabel)
        
        ingredientSwitch = UISwitch(frame: CGRect(
            x: ingredientLabel.frame.origin.x + ingredientLabel.frame.width + 60,
            y: 0,
            width: 130,
            height: 30
        ))
        ingredientSwitch.addTarget(self, action: #selector(switchAction), for: .allEvents)
        ingredientSwitch.center.y = ingredientLabel.center.y
        addSubview(ingredientSwitch)
    }
    
    // MARK: - @objc funcs
    
    @objc private func switchAction() {
        if ingredientSwitch.isOn {
            switchState = true
            (actionHandler ?? { state in print(state) })(switchState)
        } else {
            switchState = false
            (actionHandler ?? { state in print(state) })(switchState)
        }
    }
}
