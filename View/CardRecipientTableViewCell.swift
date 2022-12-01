//
//  CardRecipientTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

class CardRecipientTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelInCardRecipient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var cellModelInCardRecipient: CardRecipientTableViewModel! {
        didSet {
            setCardItems()
            
            let mainString = "Card Recipient Name*"
            let stringToColor = "*"
            let range = (mainString as NSString).range(of: stringToColor)

            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

            if cellModelInCardRecipient.cardRecipientDetails.title == "Card Recipient Name*" {
                labelInCardRecipient?.attributedText = mutableAttributedString
                
            }
            
            let mainStringInId = "Card Recipient ID *"
            let stringToColorInId = "*"
            let rangeInId = (mainStringInId as NSString).range(of: stringToColorInId)

            let mutableAttributedStringInId = NSMutableAttributedString.init(string: mainStringInId)
            mutableAttributedStringInId.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeInId)

            if cellModelInCardRecipient.cardRecipientDetails.title == "Card Recipient ID *" {
                labelInCardRecipient?.attributedText = mutableAttributedStringInId
                
            }
            
            let mainStringInNo = "Card Recipient Mobile. No. *"
            let stringToColorInNo = "*"
            let rangeInNo = (mainStringInNo as NSString).range(of: stringToColorInNo)

            let mutableAttributedStringInNo = NSMutableAttributedString.init(string: mainStringInNo)
            mutableAttributedStringInNo.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeInNo)
            
            if cellModelInCardRecipient.cardRecipientDetails.title == "Card Recipient Mobile. No. *" {
                labelInCardRecipient?.attributedText = mutableAttributedStringInNo
                
            }
            
            
            let mainStringInRelationship = "Card Recipient Relationship *"
            let stringToColorInRelationship = "*"
            let rangeInRelationship = (mainStringInRelationship as NSString).range(of: stringToColorInRelationship)

            let mutableAttributedStringInRelationship = NSMutableAttributedString.init(string: mainStringInRelationship)
            mutableAttributedStringInRelationship.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: rangeInRelationship)
            
            if cellModelInCardRecipient.cardRecipientDetails.title == "Card Recipient Relationship *" {
                labelInCardRecipient?.attributedText = mutableAttributedStringInRelationship
                
            }
            
            
        }
    }
    
    func setCardItems() {
        labelInCardRecipient.text = cellModelInCardRecipient.gettitle()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        endEditing(true)
        return true;
    }
    

}
