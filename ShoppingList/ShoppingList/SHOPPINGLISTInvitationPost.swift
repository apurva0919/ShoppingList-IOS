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
public class SHOPPINGLISTInvitationPost : AWSModel, Encodable {
    
    var listName: String?
    var invitedBy: String?
    var invitedTo: String?
    var inviteStatus: String?
    
    enum ShoppingListCodingKeys: String, CodingKey {
        case listName
        case invitedBy
        case invitedTo
        case inviteStatus
    }
    
   	public override static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]!{
		var params:[AnyHashable : Any] = [:]
		params["listName"] = "listName"
		params["invitedBy"] = "invitedBy"
		params["invitedTo"] = "invitedTo"
		params["inviteStatus"] = "inviteStatus"
		
        return params
	}
   /* public func encode(to encoder: Encoder) throws {
        var containerShoppingList = encoder.container(keyedBy: ShoppingListCodingKeys.self)
        try containerShoppingList.encode(self.listName, forKey: ShoppingListCodingKeys.listName)
        try containerShoppingList.encode(self.invitedBy, forKey: ShoppingListCodingKeys.invitedBy)
        try containerShoppingList.encode(self.invitedTo, forKey: ShoppingListCodingKeys.invitedTo)
        try containerShoppingList.encode(self.inviteStatus , forKey: ShoppingListCodingKeys.inviteStatus)
    }*/
}
