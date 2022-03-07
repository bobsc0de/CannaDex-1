//
//  FilterTVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class FilterTVC: UITableViewCell {
    
    @IBOutlet weak var filterName: UILabel!
    @IBOutlet weak var checkBoxB: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBoxB(_ sender: Any) {
        
    }

}
