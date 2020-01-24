//
//  NewExpenditureViewController.swift
//  HerhalingDeluxe
//
//  Created by ontlener on 24/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class NewExpenditureViewController: UIViewController {
    
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    var selectedCategory:String = "Pubs"
    let categories:[String] = ["Pubs","Rent","Shops","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveExpenditure(_ sender: Any) {
        if let description = descriptionTF.text, let price = Double(priceTF.text!) {
            DAO.sharedInstance.saveExpenditure(description: description, price: price, category: selectedCategory)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
extension NewExpenditureViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = categories[row]
    }
}
