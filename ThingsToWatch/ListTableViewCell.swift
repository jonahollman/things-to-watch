//
//  ListTableViewCell.swift
//  ThingsToWatch
//
//  Created by Jonah Ollman on 8/15/17.
//  Copyright © 2017 Jonah Ollman. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var locationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
