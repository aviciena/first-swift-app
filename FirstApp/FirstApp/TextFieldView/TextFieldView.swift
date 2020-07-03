//
//  MainView.swift
//  FirstApp
//
//  Created by Ibnu Siena Syam on 09/04/20.
//  Copyright © 2020 Ibnu Siena Syam. All rights reserved.
//

import UIKit

class TextFieldView: UIView {

    @IBOutlet var customView: UIView!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) { //for using CustomView in code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) { //for using CustomView in IB
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TextFieldView", owner: self, options: nil)
        addSubview(customView)
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
