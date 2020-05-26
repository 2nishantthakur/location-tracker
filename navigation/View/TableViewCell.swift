//
//  TableViewCell.swift
//  navigation
//
//  Created by Nishant Thakur on 26/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var view: UIView!
    @IBOutlet var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = view.frame.height / 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
