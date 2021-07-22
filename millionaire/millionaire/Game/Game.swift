//
//  Game.swift
//  millionaire
//
//  Created by Regina Galishanova on 23.05.2021.
//

import UIKit

final class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
        
    private let questionCaretaker = QuestionCaretaker()
    
    private(set) var records: [Record] {
        didSet {
        
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private(set) var questions: [Question] {
        didSet {

            questionCaretaker.save(questions: self.questions)
        }
    }
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionCaretaker.retrieveQuestions()
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func addQuestion(_ question: Question) {
        self.questions.append(question)
    }

    func clearQuestions() {
        self.questions = []
    }
    
}
