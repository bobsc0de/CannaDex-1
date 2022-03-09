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
    @IBOutlet weak var imgI: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var categL: UILabel!
    @IBOutlet weak var descriptionB: UIButton!
    @IBOutlet weak var dateB: UIButton!
    @IBOutlet weak var referencesB: UIButton!
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var titleCodeL: UILabel!
    @IBOutlet weak var backB: UIButton!
    @IBOutlet weak var favoriteB: UIButton!
    @IBOutlet weak var descriptionV: UIView!
    @IBOutlet weak var descriptionTextT: UITextView!
    @IBOutlet weak var scrollViewNested: UIScrollView!
    @IBOutlet weak var scrollViewNestedContentView: UIView!
    // Date Views
    @IBOutlet weak var dateV: UIView!
    @IBOutlet weak var date11L: UILabel!
    @IBOutlet weak var date12L: UILabel!
    @IBOutlet weak var date13L: UILabel!
    @IBOutlet weak var date14L: UILabel!
    @IBOutlet weak var date11ValueL: UILabel!
    @IBOutlet weak var date12ValueL: UILabel!
    @IBOutlet weak var date13ValueL: UILabel!
    @IBOutlet weak var date13AgainValueL: UILabel!
    @IBOutlet weak var date14ValueL: UILabel!
    @IBOutlet weak var date14AgainValueL: UILabel!
    @IBOutlet weak var date15T: UITextView!
    @IBOutlet weak var date16L: UILabel!
    @IBOutlet weak var date16ValueL: UILabel!
    @IBOutlet weak var date16AgainValueL: UILabel!
    @IBOutlet weak var date16Again2ValueL: UILabel!
    @IBOutlet weak var date16Again3ValueL: UILabel!
    @IBOutlet weak var date17T: UITextView!
    // Reference Views
    
    
    
    
    
    
    
    
    
    
    
    // End
    
    
    
    
    
    
    
    
    
    
    
    
    var startingPointForView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDesign()
        showView(button: "de")
        setupData()
        setupScrollView()
        
    }
    
    private func setupData(){
        descriptionB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        dateB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        referencesB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        referencesB.backgroundColor = .clear
        dateB.backgroundColor = .clear
        descriptionB.titleLabel?.textColor = UIColor.white
        dateV.isHidden = true
        descriptionV.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupDesign(){
        secondaryView.layer.cornerRadius = 40
        //secondaryView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner] for bottom radius
        secondaryView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // for top radius
        date11L.layer.cornerRadius = 12.0
        backB.layer.cornerRadius = backB.frame.height / 2
        
    }
    
    @IBAction func favoriteB(_ sender: Any) {
        
    }
    
    @IBAction func backB(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func showView(button:String) {
        if button == "de"{
            descriptionB.layer.cornerRadius = descriptionB.frame.height / 2
            descriptionB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            descriptionB.setTitleColor(.white, for: .normal)
            referencesB.backgroundColor = .clear
            referencesB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            dateB.backgroundColor = .clear
            dateB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        }else if button == "re" {
            referencesB.layer.cornerRadius = referencesB.frame.height / 2
            referencesB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.setTitleColor(.white, for: .normal)
            descriptionB.backgroundColor = .clear
            descriptionB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            dateB.backgroundColor = .clear
            dateB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        }else if button == "da" {
            dateB.layer.cornerRadius = dateB.frame.height / 2
            dateB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            dateB.titleLabel?.textColor = .white
            descriptionB.backgroundColor = .clear
            descriptionB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.titleLabel?.textColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
            referencesB.backgroundColor = .clear
        }
    }
    
    @IBAction func descriptionB(_ sender: Any) {
        showView(button: "de")
        //textT.text = "Descri"
    }
    
    @IBAction func referencesB(_ sender: Any) {
        showView(button: "re")
    }
    
    @IBAction func dateB(_ sender: Any) {
        showView(button: "da")
        dateV.isHidden = false
        descriptionV.isHidden = true
    }
    
    private func setupGesture(){
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(userSwiped))
        swipeRecognizer.numberOfTouchesRequired = 1
        swipeRecognizer.direction = .down
        contentView.addGestureRecognizer(swipeRecognizer)
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapContentView)))
    }
    
    @objc func tapContentView(){
        print("Tap")
        scrollView.isScrollEnabled = true
    }
    
    @objc func userSwiped(){
        print("Down")
        scrollView.isScrollEnabled = true
    }
    
}

extension DetailGlossaryVC:UIScrollViewDelegate {
    
    private func setupScrollView(){
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView == self.scrollView {
            if scrollView.contentOffset.y > 60 {
                UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseOut, animations: {
                    self.imgI.alpha = 0
                }, completion: nil)
            }
            
            if scrollView.contentOffset.y < 55 {
                UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn, animations: {
                    self.imgI.alpha = 1
                }, completion: nil)
            }
            
            if scrollView.contentOffset.y > 85 {
                scrollView.contentOffset.y = 85
    //            scrollView.isScrollEnabled = false
            }
        }
    }
    
}
