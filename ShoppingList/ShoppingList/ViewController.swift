//
//  ViewController.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/1/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var invitationnew = Invitation()
    var useroutput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        passwordText.delegate = self
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showList" {
            if useroutput == ""{
                // Translator Program
                let alert = UIAlertController(title: "invalid UserName or Password", message: "Please type correct username and password ", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                userNameText.text = ""
                passwordText.text = ""
                
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                
                    let destinationNavigationController = segue.destination as! UINavigationController
                    let listSelectViewController = destinationNavigationController.topViewController as! ListSelectViewController
                    listSelectViewController.userName = useroutput
                    listSelectViewController.invitationList = Invitation.getOutput()
                    
            }
            //ageViewController.image = finalImage
            //ageViewController.finalAge = finalAge
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if passwordText.text == ""{}
        else{
        userValidation()
        invitationnew.invitationGET(inviteeName: userNameText.text!)
        }
        
        

    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        
    }
    
    
    func userValidation(){
        let client = SHOPPINGLISTItemFunctionAPIClient.default()
        
        client.userfunctionUserNamePasswordGet(userName: userNameText.text ?? "", password: passwordText.text ?? "").continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            task?.waitUntilFinished()
            if let completed = task?.isCompleted{
                print("i have the result")
                print(task)
                // print(task?.result)
                let output = task?.result?.userName
                
                print(output)
                
                // Do something with result
            }
            print("nil")
            self.useroutput = task?.result?.userName ?? ""
            if self.useroutput == "" {
                print("useroutput")
            }
            return nil
        }
        
    }

    func userValidation1(){
        let client = SHOPPINGLISTItemFunctionAPIClient.default()
        
        client.invitationfunctionInviteeNameListNameDelete(listName: "list8", inviteeName: "ajain") .continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            task?.waitUntilFinished()
            if let completed = task?.isCompleted{
                print("i have the result")
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
    
    
    func userValidation2(){
        let client = SHOPPINGLISTItemFunctionAPIClient.default()
        
        client.itemFunctionListNameGet(listName: "list2").continueWith{ (task: AWSTask?) -> AnyObject? in
            if let error = task?.error {
                print("Error occurred: \(error)")
                return nil
            }
            task?.waitUntilFinished()
            if let completed = task?.isCompleted{
                print("i have the result")
                // print(task)
                // print(task?.result)
                let output = task?.result
                
                print(output)
            }
            
            
            print("nil")
            return nil
        }
    }



/*    func getTodo(_ userName: String) {
        List.listByUserName(userName, completionHandler: { (todo, error) in
            if let error = error {
                // got an error in getting the data, need to handle it
                print(error)
                return
            }
            guard let todo = todo else {
                print("error getting first todo: result is nil")
                return
            }
            // success :)
            debugPrint(todo)
        })
    }*/
    
   
    
    func userValidation3(){
        var a = SHOPPINGLISTListPOST()
        a?.userName = "apoo"
        a?.listName = "list9"
        guard let todosURL = URL(string: "https://tdgp7lq6ki.execute-api.us-east-2.amazonaws.com/dev/listfunction") else {
            let error = "Could not create URL"
            //            completionHandler(nil, error)
            return
        }
        
        // Specify this request as being a POST method
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "POST"
        todosUrlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        todosUrlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        // Now let's encode out Todo struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let newTodoAsJSON = try encoder.encode(a)
            todosUrlRequest.httpBody = newTodoAsJSON
            // See if it's right
            if let bodyData = todosUrlRequest.httpBody {
                print(String(data: bodyData, encoding: .utf8) ?? "no body data")

            }
        } catch {
            print(error)
            //            completionHandler(nil, error)
        
        }
        
        // Create and run a URLSession data task with our JSON encoded Todo request
        let session = URLSession.shared
        let task = session.dataTask(with: todosUrlRequest, completionHandler: {
            (data, response, error) in
            guard error == nil else {
                //            completionHandler(nil, error!)
            
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = data, let utf8Representation = String(data: data, encoding: .utf8) {
                print("result (data): ", data)
                print("result (utf8Representation): ", utf8Representation)
                print("result (response): ", response!)
                //                completionHandler(Todo(title: "First todo", id: nil, userId: 1, completed: true), nil)
                //                completionHandler(nil)
            } else {
                print("no readable data received in response")
            }
            
        })
        task.resume()
    }
    
    
    @IBAction func unwindToCourseList(sender: UIStoryboardSegue) {
        
        if let sourceViewCintroller = sender.source as? ListSelectViewController {
            
            userNameText.text = ""
            passwordText.text = ""
          //  allItems = sourceViewCintroller.allItems
            //  print(allItems)
          //  tableView.reloadData()
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


    
    

    


