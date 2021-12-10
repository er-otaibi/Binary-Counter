//
//  BinaryCounterTableViewCell.swift
//  Binary Counter
//
//  Created by Mac on 06/05/1443 AH.
//

import UIKit

class BinaryCounterTableViewCell: UITableViewCell {

    var delegate: BinaryCounterCellDelegate?
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func buttons(_ sender: UIButton) {
        
        
        guard let value =  valueLabel?.text else {return}
        guard let decimalValue = Decimal(string: value) else{return}
               
       let operation:String = sender.tag == 1 ? "+" : "-"
               
       delegate?.changeTotalValueLabel(value: decimalValue, operation: operation)
    }
    
}
