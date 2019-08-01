//
//  InvitationTableViewCell.swift
//  ShoppingList
//
//  Created by Apurva Jain on 5/10/19.
//  Copyright © 2019 Apurva Jain. All rights reserved.
//

import UIKit

class InvitationTableViewCell: UITableViewCell {

    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var invitedBy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
