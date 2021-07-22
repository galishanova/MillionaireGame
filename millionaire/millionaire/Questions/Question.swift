//
//  Question.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import Foundation

struct Question: Codable {
    var question: String
    var answers: [String]
    var correctAnswerIndex: Int
}

extension Question: Equatable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.question == rhs.question
    }
}

let question = Question(question: "", answers: [], correctAnswerIndex: 0)

class QuestionService {
    
    func getQuestions() -> [Question] {
        return [
            Question(question: "Какой город объявлен официальной родиной русского Деда Мороза?", answers: ["Малая Вишера", "Великий Устюг", "Нижний Новгород", "Вышний Волочек"], correctAnswerIndex: 1),
            Question(question: "Что проводит боксер, наносящий удар противнику снизу?", answers: ["Свинг", "Хук", "Джэб", "Апперкот"], correctAnswerIndex: 3),
            Question(question: "К кому первому обратились за помощью дед и бабка, не справившись с репкой?", answers: ["К Жучке", "К дочке", "К внучке", "К залу"], correctAnswerIndex: 2),
            Question(question: "Кого нет среди смешариков?", answers: ["Коня", "Свиньи", "Лося", "Барана"], correctAnswerIndex: 0),
            Question(question: "Как называется ближайшая к Земле звезда?", answers: ["Проксиома Центавра", "Полярная", "Сириус", "Солнце"], correctAnswerIndex: 3)
        ]
    }
}
