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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    private func setupGesture(){
        filterI.isUserInteractionEnabled = true
        filterI.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFilter)))
    }
    
    @objc func tapFilter(){
        print("Hello")
    }
    

}

extension GlossaryVC:UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 165
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlossaryTVC") as! GlossaryTVC
        cell.selectionStyle = .none
        return cell
    }
}
