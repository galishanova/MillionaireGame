//
//  RecordsTableViewCell.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateResults: UILabel!
    @IBOutlet weak var scoreResults: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    


}
