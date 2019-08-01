/*
 Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */


import Foundation
import AWSCore


@objcMembers
public class SHOPPINGLISTItemPOST : AWSModel, Encodable{
    
    var listName: String?
    var itemName: String?
    var quantity: NSNumber?
    var addedBy: String?
    
  	 enum ShoppingListCodingKeys: String, CodingKey {
        case listName
        case itemName
        case quantity
        case addedBy
    }
    
   	public override static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]!{
		var params:[AnyHashable : Any] = [:]
		params["listName"] = "listName"
		params["itemName"] = "itemName"
		params["quantity"] = "quantity"
		params["addedBy"] = "addedBy"
		
        return params
	}
   public func encode(to encoder: Encoder) throws {
        var containerShoppingList = encoder.container(keyedBy: ShoppingListCodingKeys.self)
        try containerShoppingList.encode(self.listName, forKey: ShoppingListCodingKeys.listName)
        try containerShoppingList.encode(self.itemName, forKey: ShoppingListCodingKeys.itemName)
        try containerShoppingList.encode(self.quantity?.stringValue, forKey: ShoppingListCodingKeys.quantity)
        try containerShoppingList.encode(self.addedBy , forKey: ShoppingListCodingKeys.addedBy)
    }
}
