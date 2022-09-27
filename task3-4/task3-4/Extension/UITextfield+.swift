//
//  UITextfield+.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

extension UITextField {
    static func addTextField(
        placeHolderText: String,
        color: UIColor,
        textAligment: NSTextAlignment,
        height: CGFloat,
        width: CGFloat,
        originX: CGFloat,
        originY: CGFloat,
        borderWidth: Float,
        cornerRadius: Float
    ) -> UITextField {
        let textField = UITextField(frame: CGRect(
            x: originX,
            y: originY,
            width: width,
            height: height)
        )
        
        textField.placeholder = placeHolderText
        textField.layer.borderColor = color.cgColor
        textField.borderStyle = .none
        
        return textField
    }
}
