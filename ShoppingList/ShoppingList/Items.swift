//
//  Items.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/7/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import Foundation


var itemsOutput: [String] = [String]()
var itemsDict: [[String: Any]]  = [[String: Any]] ()
struct Items {
    var itemsDetail = SHOPPINGLISTItemGET()


    
    
    
    
    func itemsGET(listName: String) {
        itemsDict = [[String:Any]]()
        guard let url = URL(string: "https://tdgp7lq6ki.execute-api.us-east-2.amazonaws.com/dev/itemFunction/\(listName)") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                 // print(jsonArray)
                //Now get title value
                
            //   guard let title = jsonArray[0]["quantity"] as? String else { return }
             //  print(title) // delectus aut autem
                itemsDict = jsonArray
                print("aaaaaaaaaaa\(itemsDict)")
               // print(itemsDict)
             //   for dic in jsonArray{
              //      guard let listName = dic["itemName"] as? String else { return }
                
              //      itemsOutput.append(listName)
                //    print(itemsDict)
                   
            
                    
                    
                    //   print(title)
               // }
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        task.resume()
    }
    static func getOutput() -> [[String: Any]] {
        return itemsDict
        
    }
    
    
    //MARK: POST LIST
    func listPOST(newItem: SHOPPINGLISTItemPOST){
        //  var newList = SHOPPINGLISTListPOST()
        //newList?.userName = "apoo"
        //newList?.listName = "list9"
        guard let todosURL = URL(string: "https://tdgp7lq6ki.execute-api.us-east-2.amazonaws.com/dev/itemFunction") else {
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
            let newTodoAsJSON = try encoder.encode(newItem)
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
    
    
}
