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

    var check : (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func checkBoxB(_ sender: Any) {
        if let btnAction = self.check {
                    btnAction()
        }
    }

}
