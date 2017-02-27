//
//  ItemActivityTableViewCell.swift
//  TuDu
//
//  Created by Oscar Borden on 11/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import UIKit

class ItemActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var chkActivity: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        chkActivity.setImage(UIImage(named: "checked.png"), for: UIControlState.normal)
    }

}
