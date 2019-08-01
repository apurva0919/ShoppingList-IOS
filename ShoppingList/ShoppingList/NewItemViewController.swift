//
//  NewItemViewController.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/9/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {


    @IBOutlet weak var saveItem: UIBarButtonItem!
    @IBOutlet weak var newItem: UITextField!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var itemQuantity = ["1","2","3","4","5","6","7","8","9","10"]
    var allItems:  [[String: Any]]  = [[String: Any]] ()
    
    @IBAction func newQuantity(_ sender: Any) {
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
        items.itemsGET(listName: listName!)
        
        
    }
    
    var newItemDetail = SHOPPINGLISTItemPOST()
    var items = Items()
    var listName: String?
    var currentUser: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        newItem.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

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
        guard let button = sender as? UIBarButtonItem, button === saveItem else {
            //os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        allItems = Items.getOutput()
      //  print("1223455\(allItems)")
        
   
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //  allLists =  List.getOutput()
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemQuantity.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemQuantity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // guard let select = languageData[row].description else
        //   {
        //     print("hello world")
        //}
        //print(select)
        //  buttonState.isHidden = false
        
        let a = Int(itemQuantity[row])
        newItemDetail?.itemName = newItem.text ?? ""
        newItemDetail?.quantity = NSNumber(value: a ?? 0)
        newItemDetail?.addedBy = currentUser
        newItemDetail?.listName = listName
        items.listPOST(newItem: newItemDetail!)
        
        
      //  print(listName)
    }

        
}
