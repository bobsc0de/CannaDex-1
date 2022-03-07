//
//  FavoriteVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class FavoriteVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Glossary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        getData()
        setupTableView()
        
    }
    
    private func getData(){
        let data = UserDefaults.standard.array(forKey: "saved")
        for i in 0..<data!.count {
            if data![i] as! String == "1" {
                dataSource.append(Glossary(hex: "#001", name: "White Widow", category: "Indica", rating: "4", categImage: "indica", favorite: false))
            }else if data![i] as! String == "2" {
                dataSource.append(Glossary(hex: "#002", name: "Amnesia Haze", category: "Sativa", rating: "2", categImage: "sativa", favorite: false))
            }else if data![i] as! String == "3" {
                dataSource.append(Glossary(hex: "#003", name: "Skunk 1 Auto", category: "Hybrid", rating: "5", categImage: "hybrid", favorite: false))
            }
        }
    }

}


extension FavoriteVC:UITableViewDelegate,UITableViewDataSource {
    
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
