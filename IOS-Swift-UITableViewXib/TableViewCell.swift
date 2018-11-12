//
//  TableViewCell.swift
//  IOS-Swift-UITableViewXib
//
//  Created by Pooya on 2018-10-08.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var col01View: UILabel!
    @IBOutlet weak var col02View: UILabel!
    @IBOutlet weak var col03View: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellInit(col01: String, col02: String, col03:String, iconName:String){
        col01View.text = col01
        col02View.text = col02
        col03View.text = col03
        iconView.image = UIImage(named: iconName)
        
    }
    
}
