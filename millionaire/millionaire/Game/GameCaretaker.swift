//
//  GameCaretaker.swift
//  millionaire
//
//  Created by Regina Galishanova on 23.05.2021.
//

import UIKit

final class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
            
        }
    }
    
    func retrieveRecords() -> [Record] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
            
        }
        do {
            return try self.decoder.decode([Record].self, from: data)
            
        } catch {
            print(error)
            return []
            
        }
    }
    
}

final class QuestionCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "addQuestion"
    
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
            
        }
    }
    
    func retrieveQuestions() -> [Question] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
            
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
            
        } catch {
            print(error)
            return []
            
        }
    }
    
}

