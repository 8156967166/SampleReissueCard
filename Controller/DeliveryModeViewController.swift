//
//  DeliveryModeViewController.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 10/10/22.
//

import UIKit

class DeliveryModeViewController: UIViewController, PassDataToVcDelegate {
    
    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    
    var deliveryModeArray = [DeliveryModeTableViewModel]()
    var isSelectbuttonQPost = Bool()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDeliveryModeModel()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
   
    func setDeliveryModeModel() {
        let deliveryMode = DeliveryModeTableViewModel(strTitle: "Delivery Mode", cellType: .deliveryModeCell)
        let requiredFees = DeliveryModeTableViewModel(strTitle: "", cellType: .requiredFeesCell)
//        let cardRecipientName = DeliveryModeTableViewModel(strTitle: "Card Recipient Name*", cellType: .cardRecipientName)
        let card = DeliveryModeTableViewModel(strTitle: "", cellType: .cardCell)
        
        deliveryModeArray.append(deliveryMode)
//        deliveryModeArray.append(cardRecipientName)
        deliveryModeArray.append(card)
        deliveryModeArray.append(requiredFees)
    }
    
    func buttonActionPassQPost(sender: UIButton) {
        isSelectbuttonQPost = false
        tableView.reloadData()
    }
    
    func buttonActionPassCollectfromCounter(sender: UIButton) {
        isSelectbuttonQPost = true
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - Table

extension DeliveryModeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryModeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = deliveryModeArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! DeliveryModeTableViewCell
        cell.cellModel =  cellModel
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellModel = deliveryModeArray[indexPath.row]
        
        if isSelectbuttonQPost == true {
            if cellModel.cellType == .cardCell {
                return 400
            }
        }
        else {
            if cellModel.cellType == .cardCell {
                return 0
            }
        }
        return tableView.rowHeight
    }
    
}
