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
        
        dataSource = SetupData.getFilterData()
    }
    
}
extension FilterVC:UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.rowHeight = 165
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTVC") as! FilterTVC
        cell.selectionStyle = .none
        cell.filterName.text = dataSource[indexPath.row].name
        
        return cell
    }
}
