//
//  itemContactTableViewCell.swift
//  TuDu
//
//  Created by Oscar Borden on 11/01/17.
//  Copyright © 2017 SYE Software. All rights reserved.
//

import UIKit

class itemContactTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.size.width / 2;
        self.imgAvatar.clipsToBounds = true;
        
        self.imgAvatar.layer.borderWidth = 3.0
        self.imgAvatar.layer.borderColor = UIColor.white.cgColor
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
