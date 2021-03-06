//
//  FilterVC.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Filter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        dataSource = SetupData.getFilterData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
extension FilterVC:UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTVC") as! FilterTVC
        cell.selectionStyle = .none
        cell.filterName.text = dataSource[indexPath.row].name
        
        let saved = UserDefaults.standard.stringArray(forKey: "filter")
        print(saved,"sami")
        if saved == nil {
            
        }else {
            if saved!.contains(where: {$0 == self.dataSource[indexPath.row].name}) {
               // it exists, do something
                print("Exist")
                cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                self.dataSource[indexPath.row].check = true
            } else {
               //item could not be found
                print("Hello")
                cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                self.dataSource[indexPath.row].check = false
            }
        }
        
        cell.check = {
            let saved = UserDefaults.standard.stringArray(forKey: "filter")
            if saved == nil {
                if self.dataSource[indexPath.row].check {
                    cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                    self.dataSource[indexPath.row].check = false
                    self.removeFavorite(id: self.dataSource[indexPath.row].name)
                }else {
                    cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                    self.dataSource[indexPath.row].check = true
                    self.saveFavorite(id: self.dataSource[indexPath.row].name)
                }
            }else {
                if saved!.contains(where: {$0 == self.dataSource[indexPath.row].name}) {
                    cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                    self.dataSource[indexPath.row].check = false
                    self.removeFavorite(id: self.dataSource[indexPath.row].name)
                }else {
                    cell.checkBoxB.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                    self.dataSource[indexPath.row].check = true
                    self.saveFavorite(id: self.dataSource[indexPath.row].name)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(UserDefaults.standard.stringArray(forKey: "filter"))
    }
    
    private func saveFavorite(id:String) {
        var savedFormer = UserDefaults.standard.stringArray(forKey: "filter")
        var saved = [String]()
        if savedFormer == nil {
            saved.append(id)
            UserDefaults.standard.setValue(saved, forKey: "filter")
        }else {
            if savedFormer!.contains(where: {$0 == id}) {
                
            }else {
                savedFormer?.append(id)
                UserDefaults.standard.setValue(savedFormer, forKey: "filter")
            }
        }
    }
    
    private func removeFavorite(id:String) {
        var saved = UserDefaults.standard.stringArray(forKey: "filter")
        if saved == nil {
            
        }else {
//            print("In Remove",saved)
//            print(id)
//            print(saved?.count)
            if let index = saved!.firstIndex(of: id) {
                saved!.remove(at: index)
            } else {
                // not found
            }
            UserDefaults.standard.setValue(saved, forKey: "filter")
        }
    }
}
