//
//  CreateQuestionStrategy.swift
//  millionaire
//
//  Created by Regina Galishanova on 13.06.2021.
//

import Foundation

protocol CreateQuestionsStrategy {
    
    func createQuestion() -> [Question]
}
