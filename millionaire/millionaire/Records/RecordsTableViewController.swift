//
//  RecordsTableViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit

class RecordsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var records = Game.shared.records
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        table.reloadData()
        
    }
    

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as! RecordsTableViewCell)
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        cell.dateResults.text = dateFormatter.string(from: records[indexPath.row].date)
        cell.scoreResults.text = "Результат: \(records[indexPath.row].score)/\(records[indexPath.row].questionsCount)"

        return cell
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
