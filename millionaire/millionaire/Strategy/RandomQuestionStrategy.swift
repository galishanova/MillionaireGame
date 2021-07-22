//
//  RandomQuestionStrategy.swift
//  millionaire
//
//  Created by Regina Galishanova on 13.06.2021.
//

import Foundation
import GameplayKit

final class RandomQuestionStrategy: CreateQuestionsStrategy {
    
    var questions: [Question]!
    var service: QuestionService!
    var usersQuestions = AddQuestionViewController().usersQuestions
    
    
    func createQuestion() -> [Question] {
        
        let userQuestion = Game.shared.questions
        usersQuestions.append(contentsOf: userQuestion)
        service = QuestionService()
        questions = service.getQuestions() + usersQuestions
                
        let randomQuestions = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: questions)
            as! [Question]
        
        questions = randomQuestions
        print(questions!)

        return questions
    }
    
}
