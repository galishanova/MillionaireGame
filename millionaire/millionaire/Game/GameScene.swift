//
//  GameScene.swift
//  millionaire
//
//  Created by Regina Galishanova on 14.06.2021.
//

import Foundation

final class GameScene {
        
    private let createQuestionStrategy: CreateQuestionsStrategy
    
    init(createQuestionStrategy: CreateQuestionsStrategy) {
        
        self.createQuestionStrategy = createQuestionStrategy
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
