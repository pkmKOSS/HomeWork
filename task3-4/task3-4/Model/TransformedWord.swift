//
//  HellowModel.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 23.09.2022.
//

import Foundation

/// Model для label на главной сцене
struct TransformedWord {
    func returnHello(_ word: String) -> String {
        guard word == "leohl" else { return " Неверное слово! " }
        return " Hello "
    }
}
