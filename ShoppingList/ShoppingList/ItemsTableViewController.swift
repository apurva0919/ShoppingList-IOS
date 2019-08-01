//
//  ItemsTableViewController.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/7/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var itemNames = Items()
    var listName: String?
    var allItems:  [[String: Any]]  = [[String: Any]] ()
    var currentUser: String?
    var alertItemName: String?
    var alertquantityName: Int?


    override func viewDidLoad() {
        super.viewDidLoad()
     /*   var new = SHOPPINGLISTItemPOST()
        new?.listName = "list5"
        new?.itemName = "veggie"
        new?.quantity = 3
        new?.addedBy = "ajain"
        
        var item = Items()
        item.listPOST(newItem: new!)*/
     //  itemNames.itemsGET(listName: listName!)
      //  allItems = Items.getOutput()
      //  tableView.reloadData()
      //  print("apurva jain")
      //  print(listName)
   //     print("bbbbBb\(allItems)")
        
    //    print(allItems)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       //  allItems = Items.getOutput()
       // print(allItems)
       // print("hurray below")
       


      // tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //allItems = Items.getOutput()
        return allItems.count
    }

    
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Code Source - Courses app
        let cellIdentifier =  "itemsCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ItemsTableViewCell.")
        }
        // Configure the cell...
       // cell.coursesTable = self
       // let courses = coursesData[indexPath.row]
        //cell.textLabel?.text = course.courseNumber
        //cell.textLabel?.text = course.courseTitle
       // cell.numberCell.text = courses.value(forKeyPath: "courseNumber") as? String
  //      cell.titleCell.text = courses.value(forKeyPath: "courseTitle") as? String
  //      cell.accessoryView?.tintColor = (courses.value(forKeyPath: "isFavorite") as? Bool)! ? UIColor.red : .lightGray
 //       cell.ratingButtons.ratingCourse = courses.value(forKeyPath: "courseRating") as! Int
        
        
    //    return cell

        // Configure the cell...
        
        cell.itemName.text = allItems[indexPath.row]["itemName"] as? String
        cell.quantity.text = allItems[indexPath.row]["quantity"] as? String ?? "Not available"
        cell.addedBy.text = allItems[indexPath.row]["addedBy"] as? String ?? "Not available"

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Item Name         Quantity                 AddedBy"
        
    }
 

 /*   @IBAction func addItem(_ sender: Any) {
        var newItem = SHOPPINGLISTItemPOST()
        newItem?.addedBy = currentUser
        newItem?.listName = listName
        //Code Source- https://stackoverflow.com/questions/26567413/get-input-value-from-textfield-in-ios-alert-in-swift
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Create new Item", message: "Enter a item name", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            self.alertItemName = textField.text
            newItem?.itemName = textField.text
            //1. Create the alert controller.
            let alert = UIAlertController(title: "Create new Item", message: "Enter the quantity", preferredStyle: .alert)
            
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.text = ""
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                let textField = alert.textFields![0] // Force unwrapping because we know it exists.
                self.alertquantityName = Int(textField.text ?? "0")
                newItem?.quantity = NSNumber(value: self.alertquantityName ?? 0)
                self.itemNames.listPOST(newItem: newItem!)
                self.itemNames.itemsGET(listName: self.listName!)
              //  self.allItems = Items.getOutput()
              //  self.tableView.reloadData()
             
          
            }))
            
                self.present(alert, animated: true, completion: nil)
            
           // print("Text field: \(textField.text)")
        }))
        
        // 4. Present the alert.
        
      //  print("hurray")
        self.present(alert, animated: true, completion: nil)
        
        
        
    }*/
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "newItems"{
            let destinationNavigationController = segue.destination as! UINavigationController
            let newItemViewController = destinationNavigationController.topViewController as! NewItemViewController
            
            newItemViewController.listName = listName
            newItemViewController.currentUser = currentUser
            
            
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        }
    }
    
    @IBAction func unwindToCourseList(sender: UIStoryboardSegue) {
        
      if let sourceViewCintroller = sender.source as? NewItemViewController {
        allItems = sourceViewCintroller.allItems
      //  print(allItems)
        tableView.reloadData()
           // allItems = Items.getOutput()
          //  print("ccccccccccc\(allItems)")
            //tableView.reloadData()
            // let newIndexPath = IndexPath(row: coursesData.count, section: 0)
            //  print("row 1")
            //       tabModalClass?.coursesData.append(course)
            //       tableView.insertRows(at: [newIndexPath], with: .automatic)
        
        
      //  }}
    }
    }

}
