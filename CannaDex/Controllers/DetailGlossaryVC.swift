//
//  DetailGlossaryVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/8/22.
//

import UIKit

class DetailGlossaryVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var categL: UILabel!
    @IBOutlet weak var favoriteB: UIButton!
    @IBOutlet weak var descriptionB: UIButton!
    @IBOutlet weak var dateB: UIButton!
    @IBOutlet weak var referencesB: UIButton!
    @IBOutlet weak var textT: UITextView!
    @IBOutlet weak var secondaryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDesign()
    }
    
    private func setupDesign(){
        secondaryView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func showView(button:String) {
        if button == "de"{
            descriptionB.layer.cornerRadius = 12.0
            descriptionB.backgroundColor = .green
            referencesB.backgroundColor = .clear
            dateB.backgroundColor = .clear
        }else if button == "re" {
            referencesB.layer.cornerRadius = 12.0
            referencesB.backgroundColor = .green
            descriptionB.backgroundColor = .clear
            dateB.backgroundColor = .clear
        }else if button == "da" {
            dateB.layer.cornerRadius = 12.0
            dateB.backgroundColor = .green
            descriptionB.backgroundColor = .clear
            referencesB.backgroundColor = .clear
        }
    }

    @IBAction func favoriteB(_ sender: Any) {
        
    }
    
    @IBAction func descriptionB(_ sender: Any) {
        showView(button: "de")
        textT.text = "Descri"
    }
    
    @IBAction func referencesB(_ sender: Any) {
        showView(button: "re")
        textT.text = "REfere"
    }
    
    @IBAction func dateB(_ sender: Any) {
        showView(button: "da")
        textT.text = "Date"
    }
}
