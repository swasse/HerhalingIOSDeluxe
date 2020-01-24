//
//  ExpenditureViewController.swift
//  HerhalingDeluxe
//
//  Created by ontlener on 24/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class ExpenditureViewController: UIViewController {

    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var items:[Expenditure] = [Expenditure]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = DAO.sharedInstance.getAllExpenditure()
        tableView.reloadData()
        var totaal:Double = 0
        for item in items{
            totaal += item.price
        }
        totalLbl.text = "Total expenditures: €\(totaal)"
    }
}
extension ExpenditureViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let currentExpenditure = items[indexPath.row]
        
        currentCell.textLabel?.text = currentExpenditure.desription
        currentCell.detailTextLabel?.text = "\(currentExpenditure.price)"
        
        return currentCell
    }
}
