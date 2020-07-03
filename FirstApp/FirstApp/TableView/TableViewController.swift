//
//  DetailViewController.swift
//  FirstApp
//
//  Created by Ibnu Siena Syam on 14/04/20.
//  Copyright © 2020 Ibnu Siena Syam. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Assign our tableView to datasource methods
        self.tableView.dataSource = self
        
        //Assign our tableView to delegate methods
        self.tableView.delegate = self
        
        //Create data array
        for i in 1...100 {
            data.append("\(i)")
        }
    }
    
    // MARK: - Table view data source
    
    // Return the number of sections and rows in the table.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        let text =  data[indexPath.row]
        
        // Configure the cell’s contents.
        cell.label.text = "Day \(text)"
        return cell
    }
    
    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day =  data[indexPath.row]
        let alertController = UIAlertController(title: "Hint", message: "You have selected Day \(day)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        
        //present(alertController, animated: true, completion: nil)
        //navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "CollectionViewSegue", let _ = segue.destination as? CollectionViewController, let indexPath = tableView.indexPathForSelectedRow {
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            cell.selectionStyle = .none
        }
    }
}
