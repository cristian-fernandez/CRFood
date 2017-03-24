//
//  customCell.swift
//  FoodCR2
//
//  Created by Alejandro on 2/27/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {


    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
     func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        var i = indexPath
    }
    
}
