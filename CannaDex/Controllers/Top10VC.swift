//
//  ViewController.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class Top10VC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


extension Top10VC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVC.identifier, for: indexPath) as! HomeCVC
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let controller = storyboard?.instantiateViewController(withIdentifier: GroupMessagesVC.identifier) as! GroupMessagesVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
//        if indexPath.row == 0 {
//            let controller = storyboard?.instantiateViewController(withIdentifier: GroupMembersVC.identifier) as! GroupMembersVC
//            controller.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
        
        if indexPath.row == 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: MessagesListVC.identifier) as! MessagesListVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if indexPath.row == 2 {
            let controller = storyboard?.instantiateViewController(withIdentifier: AvailableShiftsVC.identifier) as! AvailableShiftsVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if indexPath.row == 3 {
            let controller = storyboard?.instantiateViewController(withIdentifier: ScheduleVC.identifier) as! ScheduleVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if indexPath.row == 4 {
            let controller = storyboard?.instantiateViewController(withIdentifier: ClockVC.identifier) as! ClockVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if indexPath.row == 5 {
            let controller = storyboard?.instantiateViewController(withIdentifier: DocumentVC.identifier) as! DocumentVC
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
    }
    
}

extension HomeVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.bounds.width
        return CGSize(width: collectionwidth/2 - 30, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
