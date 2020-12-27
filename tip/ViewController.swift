//
//  ViewController.swift
//  tip
//
//  Created by JC on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    struct globalVar {
        static var mode = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*NotificationCenter.addObserver(self, selector: #selector(), name: Notification.Name("night"), object: nil)*/
        var angle: CGFloat = 30.0;
        for n in 1...5 {
        UIView.animate(withDuration: 1.0, animations: ({
                self.image.transform = CGAffineTransform.init(rotationAngle: angle)
        }))
            angle += 5
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        var angle: CGFloat = 30.0
        for n in 1...5 {
        UIView.animate(withDuration: 1.0, animations: ({
                self.image.transform = CGAffineTransform.init(rotationAngle: angle)
        }))
            angle += 5
        }
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipArray = [0.15, 0.18, 0.20]
        let tip = bill * tipArray[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func Reset(_ sender: Any) {
        billAmountTextField.text = ""
        tipPercentageLabel.text = String(format: "$%.2f", 0)
        totalLabel.text = String(format: "$%.2f", 0)
    }
    
    @IBAction func settings(_ sender: Any) {
        
        let vc =  storyboard?.instantiateViewController(identifier: "other") as! SettingsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.completionHandler =
            { bool in
                globalVar.mode = bool!
                self.night()
            }
        present(vc, animated: true)
    }
    
    func night()
    {
        if globalVar.mode
        {
            self.view.backgroundColor = UIColor.darkGray
            self.billAmountTextField.textColor = UIColor.white
            self.billAmountTextField.backgroundColor = UIColor.gray
            self.billAmountLabel.textColor = UIColor.white
            self.tipPercentageLabel.textColor = UIColor.white
            self.TipLabel.textColor = UIColor.white
            self.totalLabel.textColor = UIColor.white
            self.total.textColor = UIColor.white
            self.navigationController?.navigationBar.backgroundColor = UIColor.black
            self.tipAmountSegmentedControl.backgroundColor = UIColor.gray
        }
        else
        {
            //self.view.backgroundColor =
            self.view.backgroundColor = UIColor(named: "Test")
            self.billAmountTextField.textColor = UIColor.black
            self.billAmountTextField.backgroundColor = UIColor.white
            self.billAmountLabel.textColor = UIColor.black
            self.tipPercentageLabel.textColor = UIColor.black
            self.TipLabel.textColor = UIColor.black
            self.totalLabel.textColor = UIColor.black
            self.total.textColor = UIColor.black
            self.navigationController?.navigationBar.backgroundColor = UIColor.white
            self.tipAmountSegmentedControl.backgroundColor = UIColor.white
        }
    }
}

