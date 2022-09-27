//
//  TimeInterval.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 27.09.2022.
//

import Foundation

extension TimeInterval {
    /// Метод преобразует экземпляр класса TimeInterval в строку вида "минуты: секунды"
    /// - Returns: String(format: "%0.2d:%0.2d")
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let second = time % 60
        let minutes = (time / 60) % 60
        
        return String(
            format: "%0.2d:%0.2d",
            minutes,
            second
        )
    }
}
