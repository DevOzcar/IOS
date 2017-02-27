//
//  ItemCalendarTableViewCell.swift
//  TuDu
//
//  Created by Oscar Borden on 10/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import UIKit

class ItemCalendarTableViewCell: UITableViewCell {
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var btnActivity: UIButton!
    @IBOutlet weak var btnPersons: UIButton!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
