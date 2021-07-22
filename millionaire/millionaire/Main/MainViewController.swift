//
//  StartViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 20.05.2021.
//

import UIKit

enum Difficulty: Int {
    case consistent
    case random
}

class MainViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var showGameResultsButton: UIButton!
    @IBOutlet weak var lastResult: UILabel!
    @IBOutlet weak var orderPriorityLabel: UILabel!
    @IBOutlet weak var difficultControl: UISegmentedControl!
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "chosenDifficult")
    }
    
    private var difficulty: Difficulty {
        
        switch self.difficultControl.selectedSegmentIndex {
        
        case 0:
            return .consistent
        case 1:
            return .random
        default:
            return .consistent
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lastResult.text = "Последний результат: \( Game.shared.records.last?.score ?? 0)"
        
        if let value = UserDefaults.standard.value(forKey: "chosenDifficult") {
            let selectedIndex = value as! Int
            difficultControl.selectedSegmentIndex = selectedIndex
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.difficulty = self.difficulty

            destination.onGameEnd = { [weak self] result in
                self?.lastResult.text = "Последний результат: \(result)"
            }
            
        default:
            break
        }
    }
    

}
