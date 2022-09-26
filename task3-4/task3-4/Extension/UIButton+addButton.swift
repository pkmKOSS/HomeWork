//
//  UIButton+.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

extension UIButton {
    static func addButton(text: String,
                          color: UIColor,
                          textAligment: NSTextAlignment,
                          height: CGFloat,
                          width: CGFloat,
                          originX: CGFloat,
                          originY: CGFloat
    ) -> UIButton {
        let button = UIButton(frame: CGRect(
            x: originX,
            y: originY,
            width: width,
            height: height)
        )
        
        button.setTitle(text, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.textAlignment = textAligment
        
        return button
    }
}
