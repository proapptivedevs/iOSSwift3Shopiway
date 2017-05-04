//
//  SListTableViewCell.swift
//  ShopiWay
//
//  Created by Jaismeen Sandhu (300877728) on 2017-02-21.
//  Purpose : Cells Controls
//  Copyright © 2017 proapptive. All rights reserved.
//

import UIKit
// Table Cell Declaration , Dedicated Class to prototype cell
class SListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Item: UITextField!
    @IBOutlet weak var QLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // Controls the stepper
    @IBAction func QControls(_ sender: UIStepper) {
        var quant = Int(sender.value)
        QLabel.text = String(quant);
    }

    /*@IBAction func QControl(_ sender: UIStepper) {
     

    }*/
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
