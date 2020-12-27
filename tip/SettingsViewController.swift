//
//  SettingsViewController.swift
//  tip
//
//  Created by JC on 11/30/20.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var NightSwitch: UISwitch!
    @IBOutlet weak var NightLabel: UILabel!
    
    var completionHandler: ((Bool?)-> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ViewController.globalVar.mode
        {
            self.view.backgroundColor = UIColor.darkGray
            NightLabel.textColor = UIColor.white
            self.NightSwitch.setOn(true, animated: true)
        }

    }
    
    @IBAction func NightMode(_ sender: Any)
    {
        if NightSwitch.isOn
        {
            self.view.backgroundColor = UIColor.darkGray
            NightLabel.textColor = UIColor.white
        }
        else
        {
            self.view.backgroundColor = UIColor.white
            NightLabel.textColor = UIColor.black
        }
    }
    @IBAction func didTap(_ sender: Any) {
        completionHandler?(NightSwitch.isOn)
        dismiss(animated: true, completion: nil)
    }
}
