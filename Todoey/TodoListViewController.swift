
import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Kocham Frania","Kocham Bartusia","Kocham Patryka","Kocham Antka","Kocham Adiego","Kocham Arka","Kocham Krzysia","Kocham profesora Dąbrowskiego"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.barTintColor = .systemCyan
        } else {
            // Fallback on earlier versions
        }
        view.backgroundColor = .systemBlue
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
}

