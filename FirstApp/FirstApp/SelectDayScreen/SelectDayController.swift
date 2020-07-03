//
//  MainViewController.swift
//  FirstApp
//
//  Created by Ibnu Siena Syam on 14/04/20.
//  Copyright © 2020 Ibnu Siena Syam. All rights reserved.
//

import UIKit

class SelectDayController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cellReuseIdentifier")
        
        for i in 1...100 {
            data.append("\(i)")
        }
        
        label.text = ""
        tableView.isHidden = true
    }

    @IBAction func sayHello(_ sender: Any) {
        textField.resignFirstResponder()
        guard let name = textField.text, !name.isEmpty else {
            showAlert("Alert", message: "Please insert the name")
            return
        }
        
        label.text = "Hello! \(name), please select your day"
        tableView.isHidden = false
    }
    
    /*
     UITextField delegate protocol
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        let text = data[indexPath.row]
        cell.label.text = "Day \(text)"
        
        return cell
    }
    
    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        
        let day =  data[indexPath.row]
        showAlert("Hint", message: "You have selected Day \(day)")
    }
    
    /**
     * Show alert message
     */
    func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
