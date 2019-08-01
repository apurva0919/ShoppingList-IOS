//
//  InvitationTableViewController.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/10/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class InvitationTableViewController: UITableViewController {
    var allInvitations: [[String: Any]]  = [[String: Any]] ()
    var newInvitations = Invitation()
    var userName: String?
    var newlist = SHOPPINGLISTListPOST()
    var listPost = List()

    override func viewDidLoad() {
        super.viewDidLoad()
        allInvitations = Invitation.getOutput()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allInvitations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier =  "invitationsCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InvitationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ItemsTableViewCell.")
        }
        

        
        // Configure the cell...
        cell.listName.text = allInvitations[indexPath.row]["listName"] as? String
        cell.invitedBy.text = allInvitations[indexPath.row]["invitedTo"] as? String
        

        return cell
    }
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        
        inviteResult(listName: (allInvitations[indexPath.row]["listName"] as? String)!, inviteeName: (allInvitations[indexPath.row]["invitedTo"] as? String)!)
        let alert = UIAlertController(title: "Invitation", message: "Please Accept/Decline Invitation", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Decline", style: .default, handler: { action in
            self.allInvitations = Invitation.getOutput()
            tableView.reloadData()
            
        }))
        alert.addAction(UIAlertAction(title: "Accept", style: .default, handler: { action in
            self.newlist?.listName = self.allInvitations[indexPath.row]["listName"] as? String
            self.newlist?.userName = self.allInvitations[indexPath.row]["invitedTo"] as? String
            self.listPost.listPOST(newList: self.newlist!)
            self.allInvitations = Invitation.getOutput()
            tableView.reloadData()
        }))
        

        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List Name                Invited By"
        
    }
 

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
    
    func inviteResult(listName: String, inviteeName: String){
        let client = SHOPPINGLISTItemFunctionAPIClient.default()
        
        client.invitationfunctionInviteeNameListNameDelete(listName: listName, inviteeName: inviteeName) .continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            task?.waitUntilFinished()
            if let completed = task?.isCompleted{
                print("i have the result")
                self.newInvitations.invitationGET(inviteeName: self.userName!)
                //   print(task)
                // print(task?.result)
                //let output = task?.result
                // print(output)
                
                
                
                
                
            }
            
            
            // Do something with result
            
            print("nil")
            return nil
        }

    }

}
