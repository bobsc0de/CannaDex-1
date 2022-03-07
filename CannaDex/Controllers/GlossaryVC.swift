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
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//    }
    
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
        let index = dataSource[indexPath.row]
        cell.hexL.text = index.hex
        cell.titleL.text = index.name
        cell.categL.text = index.category
        cell.categI.image = UIImage(named: index.categImage)
        cell.backgroundI.layer.cornerRadius = 12.0
        print(index.categImage)
        cell.backgroundI.image = UIImage(named: index.categImage + "_bg")
        cell.categL.layer.cornerRadius = 10.0
        cell.categL.layer.masksToBounds = true

        if index.favorite {
            cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else {
            cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        let saved = UserDefaults.standard.array(forKey: "saved")
        print(saved,"sami")
//        for i in 0..<saved!.count {
//
//            if (saved![i] as! Int) - 1 == indexPath.row {
//                cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//            }
//        }
        
        cell.favorite = {
            if index.favorite {
                //cell.favoriteB.setImage(UIImage(systemName: "heart"), for: .normal)
                self.dataSource[indexPath.row].favorite = false
                self.tableView.reloadData()
                self.removeFavorite(id: String(indexPath.row + 1))
            }else {
                //cell.favoriteB.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.dataSource[indexPath.row].favorite = true
                self.tableView.reloadData()
                self.saveFavorite(id: String(indexPath.row + 1))
            }
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(UserDefaults.standard.array(forKey: "saved"))
        print(dataSource)
    }
    
    
    private func save(hex:String,name:String,category:String,rating:String,categImage:String,favorite:Bool){
        let taylor = Glossary(hex: hex, name: name, category: category, rating: rating, categImage: categImage, favorite: favorite)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(taylor) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedUser")
        }
    }
    
    private func saveFavorite(id:String) {
        var saved = [String]()
        saved.append(id)
        UserDefaults.standard.setValue(saved, forKey: "saved")
    }
    
    private func removeFavorite(id:String) {
        var saved = UserDefaults.standard.array(forKey: "saved")
        for i in 0..<saved!.count {
            if saved![i] as! String == id {
                saved?.remove(at: i)
            }
        }
        UserDefaults.standard.setValue(saved, forKey: "saved")
    }
    
    
}
