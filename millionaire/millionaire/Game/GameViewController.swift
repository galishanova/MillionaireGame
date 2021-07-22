//
//  GameViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet  var buttons: [UIButton]!
    @IBOutlet weak var progressLabel: UILabel!
    
    var service: QuestionService!
    
    var onGameEnd: ((Int) -> Void)?
        
    var correctAnswersQuantity = [Int]()
    
    var difficulty: Difficulty = .consistent
    
    var index = Observable<Int>(0)
    
    var questions: [Question] = []

    private var createQuestionStrategy: CreateQuestionsStrategy {
        switch self.difficulty {
        case .consistent:
            return ConsistentQuestionStrategy()
        case .random:
            return RandomQuestionStrategy()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        let questions = self.createQuestionStrategy.createQuestion()
        self.questions = questions
        self.index.addObserver(self, closure: { [weak self] (index, _) in
            self?.progressLabel.text = "\(index)/\(self!.questions.count)"
        })
        
        loadQuestion()
        
    }
        
    func loadQuestion() {
        
        for i in 0..<buttons.count {
            
            buttons[i].configureAnswerButton()
            buttons[i].isHidden = false
            buttons[i].isEnabled = true
            
        }
                        
        if index.value <= questions.count - 1 {
            questionNumber.text = "Вопрос № \(index.value+1)"
            
            questionText.text = questions[index.value].question
            
            let sourseAnswers = [questions[index.value].answers[0], questions[index.value].answers[1], questions[index.value].answers[2], questions[index.value].answers[3]]
                        
            let answers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: sourseAnswers)

            buttons[0].setTitle(answers[0] as? String, for: UIControl.State.normal)
            buttons[1].setTitle(answers[1] as? String, for: UIControl.State.normal)
            buttons[2].setTitle(answers[2] as? String, for: UIControl.State.normal)
            buttons[3].setTitle(answers[3] as? String, for: UIControl.State.normal)
            
        } else if index.value > questions.count - 1 {
            
            showSuccessAlert()
            let score = correctAnswersQuantity.count
            let questionsCount = questions.count
            let record = Record(date: Date(), score: score, questionsCount: questionsCount)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)

        }

    }
    
    func showSuccessAlert() {

        let alert = UIAlertController(title: "Поздравляем!", message: "Вы ответили на \(correctAnswersQuantity.count) вопросов из \(questions.count)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Супер!", style: .cancel, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    func showGameEndAlert() {

        let alert = UIAlertController(title: "Ответ неверный", message: "Игра окончена. Вы ответили на \(correctAnswersQuantity.count) вопросов из \(questions.count)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ОК", style: .cancel, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
                        
        let buttonTitle = sender.titleLabel?.text ?? ""
                
        let correctAnswerIndex = questions[index.value].correctAnswerIndex
        
        if questions[index.value].answers[correctAnswerIndex] == buttonTitle {
            correctAnswersQuantity.append(1)
            index.value+=1
            loadQuestion()

            print("correct \(correctAnswersQuantity.count)")

        } else {
            showGameEndAlert()
            
            let score = correctAnswersQuantity.count
            let questionsCount = questions.count
            let record = Record(date: Date(), score: score, questionsCount: questionsCount)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)
        }
        
    }


}


