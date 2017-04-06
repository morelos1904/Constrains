//
//  ItemTableViewCell.swift
//  Rss
//
//  Created by MCS on 3/30/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    

    @IBOutlet var lbl: UILabel!
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var content: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
