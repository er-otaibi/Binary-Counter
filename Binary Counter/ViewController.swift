//
//  ViewController.swift
//  Binary Counter
//
//  Created by Mac on 04/05/1443 AH.
//

import UIKit

class ViewController: UIViewController , BinaryCounterCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    var powerOf10 = [Decimal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        for value in 0...16{
                  powerOf10.append(pow(10, value))
              }
              
          tableView.dataSource = self
    }

    
    func changeTotalValueLabel(value:Decimal,operation:String) {
        
        guard let total = totalLabel.text else{return}
    
    
        let mySubstring = total.substring(from: 7)
        guard let decimalTotal = Decimal(string:mySubstring) else{return}
        
        
        if operation == "+"
               {
                totalLabel.text = "Total : \(decimalTotal+value)"
            
           
               }else {
                   
                totalLabel.text = "Total : \(decimalTotal-value)"
                
               }
              tableView.reloadData()
    }

}


extension ViewController: UITableViewDataSource {
    //Datasource
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return powerOf10.count
    }
    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! BinaryCounterTableViewCell
        
        cell.valueLabel?.text = "\(powerOf10[indexPath.row])"
        // This line is very important! Now the cell has a reference to the view controller itself.
        cell.delegate = self
        
        return cell
    }

    
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

}


