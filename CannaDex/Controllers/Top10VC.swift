//
//  ViewController.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class Top10VC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource = [Top10]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        dataSource = SetupData.getTop10Data()
//        UserDefaults.standard.removeObject(forKey: "saved")
        
    }

}


extension Top10VC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Top10CVC", for: indexPath) as! Top10CVC
        let index = dataSource[indexPath.row]
        cell.imgI.image = UIImage(named: index.image)
        cell.nameL.text = index.name
        cell.imgI.layer.cornerRadius = 25.0
        cell.nameL.layer.cornerRadius = 10.0
        cell.nameL.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}

extension Top10VC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.bounds.width
        return CGSize(width: collectionwidth/2 - 25, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
