//
//  GlossaryVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit
import Hero

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
        
        print("ViewWillAppear")
        self.navigationController?.navigationBar.isHidden = false
        setupData()
        tableView.reloadData()
        filterData()
        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
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
    
    private func filterData(){
        let filter = UserDefaults.standard.stringArray(forKey: "filter")
        var data2 = [Glossary]()
        var dataSourceAg = [Glossary]()
        dataSourceAg = SetupData.getGlossaryData()
        if filter?.count == 0 || filter == nil {
            dataSource = dataSourceAg
            print(dataSource)
            tableView.reloadData()
        }else {
            for i in 0..<filter!.count {
                if dataSourceAg.contains(where: {$0.category == filter![i]}) {
                   // it exists, do something
                    data2.append(dataSourceAg[i])
                } else {
                   //item could not be found
                }
            }
            print(data2)
            dataSource.removeAll()
            dataSource = data2
            tableView.reloadData()
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
        cell.backgroundV.layer.cornerRadius = 30
        cell.backgroundV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        if cell.favoriteB.imageView?.image == UIImage(systemName: "heart.fill") {
            index.favorite = true
        }else {
            index.favorite = false
        }
        
        let saved = UserDefaults.standard.stringArray(forKey: "saved")
        //print(saved,"sami")
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
            let saved = UserDefaults.standard.stringArray(forKey: "saved")
            if saved == nil {
                if index.favorite {
                    cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
                    self.dataSource[indexPath.row].favorite = false
                    self.removeFavorite(id: String(indexPath.row + 1))
                }else {
                    cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                    self.dataSource[indexPath.row].favorite = true
                    self.saveFavorite(id: String(indexPath.row + 1))
                }
            }else {
                if saved!.contains(where: {$0 == "\(indexPath.row + 1)"}) {
                    cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
                    self.dataSource[indexPath.row].favorite = false
                    self.removeFavorite(id: String(indexPath.row + 1))
                }else {
                    cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                    self.dataSource[indexPath.row].favorite = true
                    self.saveFavorite(id: String(indexPath.row + 1))
                }
            }
            
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlossaryTVC") as! GlossaryTVC
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailGlossaryVC") as! DetailGlossaryVC
        controller.modalPresentationStyle = .fullScreen
        controller.imgString = dataSource[indexPath.row].categImage
        cell.categI.heroID = "imageView"
        controller.imgI.heroID = "imageView"
        showHero(controller)
        //self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    private func saveFavorite(id:String) {
        var savedFormer = UserDefaults.standard.stringArray(forKey: "saved")
        var saved = [String]()
        if savedFormer == nil {
            saved.append(id)
            UserDefaults.standard.setValue(saved, forKey: "saved")
        }else {
            if savedFormer!.contains(where: {$0 == id}) {
                
            }else {
                savedFormer?.append(id)
                UserDefaults.standard.setValue(savedFormer, forKey: "saved")
            }
        }
//        print(saved,"Saved")
//        print(savedFormer,"savedFormer")
        
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
