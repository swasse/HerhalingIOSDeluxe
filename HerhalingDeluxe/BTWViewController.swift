//
//  ViewController.swift
//  HerhalingDeluxe
//
//  Created by ontlener on 24/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class BTWViewController: UIViewController {

    @IBOutlet weak var priceTf: UITextField!
    @IBOutlet weak var btwSC: UISegmentedControl!
    @IBOutlet weak var resultLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let font = UIFont.init(name: "Futura", size: 20)
        btwSC.setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
    }

    @IBAction func calcBTW() {
        if var price = Double.init(priceTf.text!){
            switch btwSC.selectedSegmentIndex {
                case 0: price *= 1.06
                case 1: price *= 1.12
                case 2: price *= 1.21
                default: price = 0
            }
            resultLBL.text = String.init(format: "€%.2f", price)
        }
    }
    
    @IBAction func dismissKeyboards(_ sender: Any) {
        priceTf.resignFirstResponder()
    }
}


