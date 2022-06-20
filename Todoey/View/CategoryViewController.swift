//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Michal Fereniec on 26/05/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //pls why does it not run?
    // i pray for my abundance in programming...
    //praying still
    
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    //MARK: - Data Manipulation Methods

    func saveItems(){
        
        
        do {
            try context.save()
        } catch {
           print("Error saving context \(context)")
        }

        self.tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()){

        do{
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }

        self.tableView.reloadData()

    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
    }
    
    //MARK: - TableView Delegate Methods
    

    
}
