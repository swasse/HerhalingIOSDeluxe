//
//  DAO.swift
//  HerhalingDeluxe
//
//  Created by ontlener on 24/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import Foundation

import CoreData

class DAO{
    static let sharedInstance = DAO.init()
    private init(){}

    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer.init(name: "Model")
        container.loadPersistentStores(completionHandler:{
            (storeDescription, error) in
            //alle foutafhandeling
        })
        return container
    }()
    

    private func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
            }
        }
    }

    func saveExpenditure(description:String, price:Double, category:String){
        //nieuwe idea meteen in de juiste context plaatsen
        let newExpenditure = Expenditure.init(context: persistentContainer.viewContext)
        
        newExpenditure.desription = description
        newExpenditure.price = price
        newExpenditure.category = category
        
        saveContext()
    }

    func getAllExpenditure() -> [Expenditure]{
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Expenditure")
        do{
            let Expenditures = try persistentContainer.viewContext.fetch(request) as! [Expenditure]
            return Expenditures
        }catch{
            return []
        }
    }
    
}
