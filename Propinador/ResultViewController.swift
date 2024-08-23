//
//  ResultViewController.swift
//  Propinador
//
//  Created by Usuario on 22/08/24.
//

import UIKit

class ResultViewController: UIViewController {

    var tip:Float = 0
    var numPersons:Int = 1
    var cost:Float = 0
    
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var PerPersonCost: UILabel!
    
    
    @IBOutlet weak var TipMoneyLabel: UILabel!
    
    @IBOutlet weak var NumPersonsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TotalLabel.text = CalculateTotal()
        TipLabel.text = String(tip) + "%"
        PerPersonCost.text = CalculatePerPersonCost() + "$"
        
        TipMoneyLabel.text = String(cost*tip/100 ) + "$"
        
        NumPersonsLabel.text = String(numPersons)
    }
    
    
    func CalculateTotal()->String{
        return String(cost + cost*tip/100) + "$"
    }
    
    func CalculatePerPersonCost()->String{
        
        let total = (cost + cost*tip/100) / Float(numPersons)
        
        
        return String(total)
        
    }
    
    
    
    

}
