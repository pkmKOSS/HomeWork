//
//  UIKit+.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

extension UILabel {
    static func addLabel(text: String,
                         color: UIColor,
                         textAligment: NSTextAlignment,
                         height: CGFloat,
                         width: CGFloat,
                         originX: CGFloat,
                         originY: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(
            x: originX,
            y: originY,
            width: width,
            height: height)
        )
        
        label.text = text
        label.backgroundColor = color
        label.textAlignment = textAligment
        
        return label
    }
}
