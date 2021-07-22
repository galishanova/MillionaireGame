//
//  ButtonView.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit

extension UIButton {
    func configureAnswerButton() {
        let button = self
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControl.State.init())
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        button.layer.cornerRadius = button.bounds.height / 2
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.contentEdgeInsets.left = 20
    }
}
