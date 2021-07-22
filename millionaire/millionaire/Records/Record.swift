//
//  Record.swift
//  millionaire
//
//  Created by Regina Galishanova on 23.05.2021.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Int
    let questionsCount: Int
}
