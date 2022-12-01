//
//  DeliveryModeTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 10/10/22.
//

import UIKit
protocol PassDataToVcDelegate {
    
    func buttonActionPassQPost(sender: UIButton)
    func buttonActionPassCollectfromCounter(sender: UIButton)
}
class DeliveryModeTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelDeliveryModeTitle: UILabel?
    @IBOutlet weak var imageInQPost: UIImageView?
    @IBOutlet weak var viewInQPost: UIView?
    @IBOutlet weak var labelQPost: UILabel?
    @IBOutlet weak var imageInCollectFromCounter: UIImageView?
    @IBOutlet weak var viewInCollectFromCounter: UIView?
    @IBOutlet weak var labelCollectFromCounter: UILabel?
    @IBOutlet weak var buttonQPost: UIButton!
    @IBOutlet weak var buttonCollectfromCounter: UIButton!
    @IBOutlet weak var tableViewInCard: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var delegate: PassDataToVcDelegate?
    var iconClick = true
    var cardRecipientArray = [CardRecipientTableViewModel]()
    var cellModel: DeliveryModeTableViewModel! {
        didSet {
            setDeliveryModeItems()
            setGradientInQPost()
            setGradientInCollectFromCounter()
            setCardRecipientModel()
//            imageInQPost?.image = UIImage(named: "selectedDeliveryImg")
//            viewInQPost?.backgroundColor = .white
//            labelQPost?.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        }
    }
    
    func setGradientInQPost() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewInQPost?.bounds ?? CGRect.null
                
        viewInQPost?.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setGradientInCollectFromCounter() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewInCollectFromCounter?.bounds ?? CGRect.null
                
        viewInCollectFromCounter?.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setDeliveryModeItems() {
        labelDeliveryModeTitle?.text = cellModel.getTitle()
    }
    
    func setdisable() {
        imageInCollectFromCounter?.image = UIImage(systemName: "profile")
        imageInQPost?.image = UIImage(systemName: "profile")
        labelCollectFromCounter?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewInCollectFromCounter?.backgroundColor = .lightGray
        viewInQPost?.backgroundColor = .lightGray
        labelQPost?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    func setCardRecipientModel() {
        
        let cardRecipientName = CardRecipientTableViewModel(strTitle: "Card Recipient Name*", cellType: .cardRecipientCell)
        let cardRecipientID = CardRecipientTableViewModel(strTitle: "Card Recipient ID *", cellType: .cardRecipientCell)
        let cardRecipientMobileNo = CardRecipientTableViewModel(strTitle: "Card Recipient Mobile. No. *", cellType: .cardRecipientCell)
        let cardRecipientRelationship = CardRecipientTableViewModel(strTitle: "Card Recipient Relationship *", cellType: .cardRecipientCell)
        
        cardRecipientArray.append(cardRecipientName)
        cardRecipientArray.append(cardRecipientID)
        cardRecipientArray.append(cardRecipientMobileNo)
        cardRecipientArray.append(cardRecipientRelationship)
    }
    
    @IBAction func buttonActionQPost(sender: UIButton) {
        setdisable()
        imageInQPost?.image = UIImage(named: "selectedDeliveryImg")
        viewInQPost?.backgroundColor = .white
        labelQPost?.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        
        delegate?.buttonActionPassQPost(sender: buttonQPost)
    
    }
    
    @IBAction func buttonActionCollectfromCounter(sender: UIButton) {
        setdisable()
        imageInCollectFromCounter?.image = UIImage(named: "selectedDeliveryImg")
        viewInCollectFromCounter?.backgroundColor = .white
        labelCollectFromCounter?.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        
        delegate?.buttonActionPassCollectfromCounter(sender: buttonCollectfromCounter)
    }
    
  
    

}


extension DeliveryModeTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardRecipientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModelInCard = cardRecipientArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModelInCard.identifier, for: indexPath) as! CardRecipientTableViewCell
        cell.cellModelInCardRecipient = cellModelInCard
        return cell
    }
   
}
