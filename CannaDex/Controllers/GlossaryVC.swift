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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
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
        let index = dataSource[indexPath.row]
        cell.hexL.text = index.hex
        cell.titleL.text = index.name
        cell.categL.text = index.category
        cell.categI.image = UIImage(named: index.categImage)
        cell.backgroundI.layer.cornerRadius = 12.0
        return cell
    }
}
