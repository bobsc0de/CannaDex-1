//
//  GlossaryTVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class GlossaryTVC: UITableViewCell {
    
    @IBOutlet weak var contentVieww: UIView!
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var hexL: UILabel!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var categL: UILabel!
    @IBOutlet weak var ratingV: UIView!
    @IBOutlet weak var favoriteB: UIButton!
    @IBOutlet weak var categI: UIImageView!
    @IBOutlet weak var backgroundI: UIImageView!
    
    var favorite : (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    @IBAction func favoriteB(_ sender: Any) {
        if let btnAction = self.favorite {
                    btnAction()
        }
    }
}
