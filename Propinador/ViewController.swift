//
//  ViewController.swift
//  Propinador
//
//  Created by Usuario on 14/08/24.
//

import UIKit

class ViewController: UIViewController {

    var numPersons:Int = 1
    var cost:Float = 0
    var tip:Float = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumPersonsLabel.text = String(numPersons)
        
        VerifyInputs()
    }
    
    
    
    @IBOutlet weak var TipInputField: UITextField!
    
    @IBOutlet weak var CostInputField: UITextField!
    
    @IBOutlet weak var NumPersonsStepper: UIStepper!
    
    @IBOutlet weak var NumPersonsLabel: UILabel!
    
    
    @IBOutlet weak var ButtonTip10: UIButton!
    
    @IBOutlet weak var ButtonTip15: UIButton!
    
    @IBOutlet weak var ButtonTip20: UIButton!
    
    
    @IBOutlet weak var CalculateButton: UIButton!
    
    
    
    ///actions
    
    @IBAction func OnClickCalculate(_ sender: UIButton) {
        
        if tip < 0{
            return
        }
        
        
        let resultView = self.storyboard?.instantiateViewController(withIdentifier: "result_view") as! ResultViewController
        
        resultView.tip = tip
        resultView.cost = cost
        resultView.numPersons = numPersons
        
        self.navigationController?.pushViewController(resultView, animated: true)
        
        
        
    }
    
    
    @IBAction func OnChangedCustomTip(_ sender: UITextField) {
        
        VerifyInputs()
    }
    
    @IBAction func OnChangedCost(_ sender: UITextField) {
        
        VerifyInputs()
    }
    
   
    
    
    @IBAction func OnClickTip10(_ sender: Any) {
        tip = 10
        UpdateButtons()
        TipInputField.text = ""
    }
    
   
    @IBAction func OnClickTip15(_ sender: Any) {
        tip = 15
        UpdateButtons()
        TipInputField.text = ""

    }
    
    
    
    @IBAction func OnClickTip20(_ sender: Any) {
        tip = 20
        UpdateButtons()
        TipInputField.text = ""

    }
    
    
    @IBAction func OnNumPersonsChanged(_ sender: Any) {
        
        
        numPersons = Int(NumPersonsStepper.value) + 1
        NumPersonsLabel.text = String(numPersons)
    }
    
    

    
    
    func UpdateButtons(){
        let selectedColor = UIColor.tintColor
        let unselectedColor = UIColor.black
        
        ButtonTip10.tintColor = unselectedColor
        
        ButtonTip15.tintColor = unselectedColor
        
        ButtonTip20.tintColor = unselectedColor
        
        
        
        
        switch tip {
        case 10:
            ButtonTip10.tintColor = selectedColor
            
        case 15:
            ButtonTip15.tintColor = selectedColor
        
        case 20:
            ButtonTip20.tintColor = selectedColor
        
        default:
            var _ = 0
            
        }
        
        
        //calc button
        if tip > 0 && cost >= 0 {
            CalculateButton.isEnabled = true
        }else {
            CalculateButton.isEnabled = false
        }
        
    }
    

    @IBAction func OnGesture(_ sender: Any) {
        
        VerifyInputs()
        
    }
    
    
    func VerifyInputs(){
        CostInputField.resignFirstResponder()
        TipInputField.resignFirstResponder()
        
        
        if let text = CostInputField.text, let floatValue = Float(text) {
               cost = floatValue
           } else {
               cost = 0.0
               CostInputField.text = ""
           }
        
        
        if let text = TipInputField.text, let floatValue = Float(text) {
               tip = floatValue
           } else {
               tip = 0.0
               TipInputField.text = ""
           }
        
        UpdateButtons()
    }
    

}

