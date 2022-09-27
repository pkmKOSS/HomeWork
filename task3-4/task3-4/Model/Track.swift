//
//  Track.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 26.09.2022.
//

import Foundation
import UIKit

/// Структура описывающая музыкальную композицию.
/// singer - имя исполнителя
/// trackName - название композиции
/// duration - продолжительность композиции
/// albumImage - фото альбома
struct Track {
    let singer: String
    let trackName: String
    let duration: String
    let nameOfImage: String
}

extension Track: Equatable {
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.singer == rhs.singer &&
        lhs.trackName == rhs.trackName &&
        lhs.duration == rhs.duration
    }
}
