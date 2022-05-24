
import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.barTintColor = .systemCyan
        }
        view.backgroundColor = .systemBlue
        
        
        let newItem = Item()
        newItem.title = "Kocham Frania "
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Kocham krzysia "
        itemArray.append(newItem)
      
        
        let newItem3 = Item()
        newItem3 .title = "Kocham bartusia "
        itemArray.append(newItem)
        
        
        
    
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { UIAlertAction in
            // what will happen when the user clicks the Add Item Button
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            //text is neva nil so thats why we need to force unwrap this textField shit
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            //reload data in order to  show this mafuckin' array because its hella buggy
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
             
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

