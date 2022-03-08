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
    @IBOutlet weak var favoriteB: UIButton!
    @IBOutlet weak var descriptionB: UIButton!
    @IBOutlet weak var dateB: UIButton!
    @IBOutlet weak var referencesB: UIButton!
    @IBOutlet weak var textT: UITextView!
    @IBOutlet weak var secondaryView: UIView!
    
    
    var startingPointForView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDesign()
        showView(button: "de")
        textT.text = "Descri"
        descriptionB.backgroundColor = #colorLiteral(red: 0.1961533725, green: 0.7796291709, blue: 0.3441372514, alpha: 1)
        referencesB.backgroundColor = .clear
        dateB.backgroundColor = .clear
        descriptionB.titleLabel?.textColor = UIColor.white
        setupGesture()
        setupScrollView()
        
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                self.scrollView.contentOffset.x = CGFloat(self.startingPointForView)
//            }, completion: nil)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupDesign(){
        secondaryView.layer.cornerRadius = 40
        //secondaryView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner] for bottom radius
        secondaryView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // for top radius
        
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
    
    private func setupGesture(){
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(userSwiped))
        swipeRecognizer.numberOfTouchesRequired = 1
        swipeRecognizer.direction = .down
        contentView.addGestureRecognizer(swipeRecognizer)
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
            scrollView.isScrollEnabled = false
        }
    }
    
}
