//
//  CollectionViewController.swift
//  FirstApp
//
//  Created by Ibnu Siena Syam on 16/04/20.
//  Copyright © 2020 Ibnu Siena Syam. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Set data collection view
    private let data: [String] = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "One", "Two", "Three", "Four", "Five", "Six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    // Return the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // Provide a  cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReuseIdentifier", for: indexPath) as! CustomCollectionViewCell
        
        cell.label.text = data[indexPath.row]
            
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hint", message: "You have selected \(data[indexPath.row])", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        //present(alertController, animated: true, completion: nil)
        
        let selectDayController = SelectDayController(nibName: "SelectDayController", bundle: nil)
        present(selectDayController, animated: true, completion: nil)
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    //Return spacing between successive rows of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4;
    }
    
    //Return spacing between successive items in the columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1;
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // In this function is to change size of Collection view /based on frame width
        let widthHeight  = (view.frame.width - 30)/2
        return CGSize(width: widthHeight, height: widthHeight)
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
