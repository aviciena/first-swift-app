//
//  CustomCollectionViewCell.swift
//  FirstApp
//
//  Created by Ibnu Siena Syam on 16/04/20.
//  Copyright © 2020 Ibnu Siena Syam. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 10
    }
}
