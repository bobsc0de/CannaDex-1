//
//  GlossaryVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class GlossaryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchT: UITextField!
    @IBOutlet weak var filterI: UIImageView!
    
    var dataSource = [Glossary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupGesture()
        dataSource = SetupData.getGlossaryData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tableView.reloadData()
        print(dataSource)
        setupData()
        tableView.reloadData()
    }
    
    private func setupData(){
        let saved = UserDefaults.standard.stringArray(forKey: "saved")
        if saved == nil {
            
        }else {
            if saved!.contains(where: {$0 == "1"}) {
                self.dataSource[0].favorite = true
            }else if saved!.contains(where: {$0 == "1"}) {
                self.dataSource[0].favorite = true
            }else if saved!.contains(where: {$0 == "1"}) {
                self.dataSource[0].favorite = true
            }
        }
    }
    
    private func setupGesture(){
        filterI.isUserInteractionEnabled = true
        filterI.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFilter)))
    }
    
    @objc func tapFilter(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        controller.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}

extension GlossaryVC:UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlossaryTVC") as! GlossaryTVC
        cell.selectionStyle = .none
        var index = dataSource[indexPath.row]
        cell.hexL.text = index.hex
        cell.titleL.text = index.name
        cell.categL.text = index.category
        cell.categI.image = UIImage(named: index.categImage)
        cell.backgroundI.layer.cornerRadius = 12.0
        cell.backgroundI.image = UIImage(named: index.categImage + "_bg")
        cell.categL.layer.cornerRadius = 10.0
        cell.categL.layer.masksToBounds = true
        
        
        if cell.favoriteB.imageView?.image == UIImage(systemName: "heart.fill") {
            index.favorite = true
        }else {
            index.favorite = false
        }
        
        let saved = UserDefaults.standard.stringArray(forKey: "saved")
        print(saved,"sami")
        if saved == nil {
            
        }else {
            if saved!.contains(where: {$0 == "\(indexPath.row + 1)"}) {
               // it exists, do something
                cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
               //item could not be found
                cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
        
        
        cell.favorite = {
            print(index.favorite)
            
//            if index.favorite {
//                index.favorite = false
//            }else {
//                index.favorite = true
//            }
                    
            if index.favorite {
                cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
//                self.dataSource[indexPath.row].favorite = false
                index.favorite = false
                //self.tableView.reloadData()
                self.removeFavorite(id: String(indexPath.row + 1))
            }else {
                cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                //self.dataSource[indexPath.row].favorite = true
                index.favorite = true
                print("In CLick ",UserDefaults.standard.stringArray(forKey: "saved"))
                self.saveFavorite(id: String(indexPath.row + 1))
            }
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(UserDefaults.standard.stringArray(forKey: "saved"))
    }
    
    
    private func saveFavorite(id:String) {
        var savedFormer = UserDefaults.standard.stringArray(forKey: "saved")
        var saved = [String]()
        if savedFormer == nil {
            saved.append(id)
            UserDefaults.standard.setValue(saved, forKey: "saved")
        }else {
            savedFormer?.append(id)
            UserDefaults.standard.setValue(savedFormer, forKey: "saved")
        }
        print(saved,"Saved")
        print(savedFormer,"savedFormer")
        
    }
    
    private func removeFavorite(id:String) {
        var saved = UserDefaults.standard.stringArray(forKey: "saved")
        if saved == nil {
            
        }else {
            for i in 0..<saved!.count {
                if saved![i] == id {
                    saved?.remove(at: i)
                }
            }
            UserDefaults.standard.setValue(saved, forKey: "saved")
        }
        
    }
    
    
}
