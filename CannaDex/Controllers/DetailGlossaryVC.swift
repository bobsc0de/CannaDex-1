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
        showView(button: "de")
        textT.text = "Descri"
        descriptionB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        referencesB.backgroundColor = .clear
        dateB.backgroundColor = .clear
        descriptionB.titleLabel?.textColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupDesign(){
        secondaryView.layer.cornerRadius = 20
        secondaryView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    private func showView(button:String) {
        if button == "de"{
            descriptionB.layer.cornerRadius = 12.0
            descriptionB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            descriptionB.setTitleColor(.white, for: .normal)
            referencesB.backgroundColor = .clear
            referencesB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            dateB.backgroundColor = .clear
            dateB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        }else if button == "re" {
            referencesB.layer.cornerRadius = 12.0
            referencesB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.setTitleColor(.white, for: .normal)
            descriptionB.backgroundColor = .clear
            descriptionB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            dateB.backgroundColor = .clear
            dateB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        }else if button == "da" {
            dateB.layer.cornerRadius = 12.0
            dateB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            //dateB.tintColor = UIColor.white
            dateB.setTitleColor(.white, for: .normal)
            descriptionB.backgroundColor = .clear
            descriptionB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.backgroundColor = .clear
        }
    }

    @IBAction func favoriteB(_ sender: Any) {
        
    }
    
    @IBAction func descriptionB(_ sender: Any) {
        showView(button: "de")
        textT.text = "Descri"
        descriptionB.setTitleColor(UIColor.white, for: .normal)
        descriptionB.tintColor = .white
    }
    
    @IBAction func referencesB(_ sender: Any) {
        showView(button: "re")
        textT.text = "REfere"
        referencesB.setTitleColor(UIColor.white, for: .normal)
        referencesB.tintColor = .white
    }
    
    @IBAction func dateB(_ sender: Any) {
        showView(button: "da")
        textT.text = "Date"
        dateB.setTitleColor(UIColor.white, for: .normal)
    }
}
