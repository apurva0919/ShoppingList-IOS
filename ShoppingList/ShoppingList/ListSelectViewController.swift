//
//  ListSelectViewController.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/1/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class ListSelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var allLists:  [String] = [String]()
    var userName: String!
    var listNames = List()
    var alertListName: String?
    let date = Date()
    let format = DateFormatter()
    var formattedDate:String?
    var listName: String?
    var itemNames = Items()
    var inviteeName = Invitation()
    var itemsList:  [[String: Any]]  = [[String: Any]] ()
    var invitationList:  [[String: Any]]  = [[String: Any]] ()
    var invitationnew = Invitation()
    
    @IBOutlet weak var listButton: UIButton!
    

    @IBOutlet weak var LogOut: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        listNames.listGET(userName: userName)
        invitationnew.invitationGET(inviteeName: userName ?? "")
        format.dateFormat = "MM-dd-yyyy"
        formattedDate = format.string(from: date)
        
        if invitationList.count > 0 {
            let alert = UIAlertController(title: "Invitation New/Pending", message: "You have some New/Pending Invitations. Please check into your invitation tab ", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
      //  allLists =  List.getOutput()
       // let pickerView = UIPickerView()
      //  selectLists.inputView = pickerView
        
        
        
    
      //  print(userName)

        // Do any additional setup after loading the view.
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "showItems":
            guard let itemViewController = segue.destination as? ItemsTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            itemViewController.listName = listName
            itemViewController.allItems = itemsList
            itemViewController.currentUser = userName

           
            
        case "showNewListItems":
            
            
            
            guard let itemViewController = segue.destination as? ItemsTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            itemViewController.listName = listName
            itemViewController.allItems = itemsList


            
            //  (selectedCourse.value(forKeyPath: "courseViewed") as? Int) = (selectedCourse?.value(forKeyPath: "courseViewed") + count
            //   var temp = (selectedCourse?.value(forKeyPath: "courseViewed") as? Int)
            //   temp   = (selectedCourse?.value(forKeyPath: "courseViewed") as! Int) + count
            //(selectedCourse?.value(forKeyPath: "courseViewed") as? Int) = temp
        case "showInvitations":
            
            
            
            guard let invitationViewController = segue.destination as? InvitationTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            invitationViewController.userName = userName
        case "":
            guard let button = sender as? UIBarButtonItem, button === LogOut else {
                //os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
                return
            }
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   
    
    
    @IBAction func selectList(_ sender: Any) {
       //listNames.listGET(userName: userName)
       allLists =  List.getOutput()
        //for value in 0..<allLists.count {
          //  print(("\(value + 1). \(allLists[value])") + ("\n"))
        //}
        // Code source https://stackoverflow.com/questions/53774232/show-a-uipickerview-when-a-button-is-tapped
        picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
        listButton.titleLabel?.text = listName

        
        
    }

    @IBAction func createList(_ sender: Any) {
        var newList = SHOPPINGLISTListPOST()
        newList?.userName = userName
        //Code Source- https://stackoverflow.com/questions/26567413/get-input-value-from-textfield-in-ios-alert-in-swift
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Create List", message: "Enter a list name", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            self.alertListName = textField.text
            newList?.listName = textField.text
            if newList?.listName == ""{
                newList?.listName = self.formattedDate
            }
            self.listNames.listPOST(newList: newList!)
            self.listName = newList?.listName
           // self.performSegue(withIdentifier: "showNewItems", sender: self)
            
            
            print("Text field: \(textField.text)")
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
       // self.listNames.listGET(userName: self.userName)
        
        
        
    
    
    

            //ageViewController.image = finalImage
            //ageViewController.finalAge = finalAge
        
        
    }
    
    
    
    @IBAction func goToItems(_ sender: Any) {
        itemsList = Items.getOutput()
       // print("aaaaa\(itemsList)")
    }
    
    @IBAction func invitePeople(_ sender: Any) {
        
        var newInvitee = SHOPPINGLISTInvitationPost()
        newInvitee?.listName = listName
        newInvitee?.invitedBy = userName
        //Code Source- https://stackoverflow.com/questions/26567413/get-input-value-from-textfield-in-ios-alert-in-swift
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Invite a member", message: "Enter the invitee name", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            self.alertListName = textField.text
            newInvitee?.invitedTo = textField.text
            
            //self.listName = newList?.listName
            // self.performSegue(withIdentifier: "showNewItems", sender: self)
            
            
            print("Text field: \(textField.text)")
            
            let alert = UIAlertController(title: "Invite a member", message: "Enter the list name", preferredStyle: .alert)
            
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.text = ""
            }
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "Send an invite", style: .default, handler: { action in
                
                let textField = alert.textFields![0] // Force unwrapping because we know it exists.
                self.alertListName = textField.text
                newInvitee?.listName = textField.text
                newInvitee?.inviteStatus = "True"
                self.inviteeName.inviteePOST(newItem: newInvitee!)
                
                
                //self.listName = newList?.listName
                // self.performSegue(withIdentifier: "showNewItems", sender: self)
                
                
                print("Text field: \(textField.text)")
            }))
            self.present(alert, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      //  allLists =  List.getOutput()
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allLists.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allLists[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // guard let select = languageData[row].description else
        //   {
        //     print("hello world")
        //}
        //print(select)
        //  buttonState.isHidden = false
        
        listName = allLists[row]
        itemNames.itemsGET(listName: listName!)
        print(listName)
    }
    



}
