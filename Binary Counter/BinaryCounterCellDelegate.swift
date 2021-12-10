//
//  BinaryCounterCellDelegate.swift
//  Binary Counter
//
//  Created by Mac on 06/05/1443 AH.
//
import Foundation
import UIKit

protocol BinaryCounterCellDelegate: AnyObject {
    
    func changeTotalValueLabel(value:Decimal,operation:String)

}
