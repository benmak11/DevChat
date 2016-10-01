//
//  UserCell.swift
//  DevChat
//
//  Created by Baynham Makusha on 9/29/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCheckMark(selected: Bool) {
        
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        
        
    }

}
