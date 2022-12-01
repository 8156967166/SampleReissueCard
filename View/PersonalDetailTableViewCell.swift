//
//  PersonalDetailTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import UIKit

protocol PassDataToPersonVcDelegate {
    
    func buttonActionTamwinPass(sender: UIButton)
    func passTextFieldInFamilyNumber(strFamilyNumber: String, passModel: PersonalDetailTableViewModel)
}

class PersonalDetailTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelPersonalDetailTitle: UILabel?
    @IBOutlet weak var buttonTamwin: UIButton!
    @IBOutlet weak var textFieldEnter: UITextField?
    @IBOutlet weak var tableDropDown: UITableView!
    @IBOutlet weak var labelInTamwinCardNumber: UILabel!
    @IBOutlet weak var heightOfViewInTamwinCardNumber: NSLayoutConstraint?
    @IBOutlet weak var heightInRequestNumber: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var model: PersonalDetailTableViewModel!
    var delegate: PassDataToPersonVcDelegate?
    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
    var strRequestNumber = UILabel()
    var tamwinCardNumberArray = [TamwinCardTableViewModel]()
    
    var cellModel: PersonalDetailTableViewModel! {
        didSet {
           
            setPersonalDetailItems()
            settamwinCardModel()
            model = cellModel
            let mainString = "Request Number *"
            let stringToColor = "*"
            let range = (mainString as NSString).range(of: stringToColor)

            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            if (cellModel.cellType == .familyNumberCell) || (cellModel.cellType == .dropDownCell) || (cellModel.cellType == .familyTypeCell)  {
                heightInRequestNumber?.constant = 0
            }
            
            if cellModel.cellType == .requestNumberCell {
                labelPersonalDetailTitle?.attributedText = mutableAttributedString
               
            }
           
            
            textFieldEnter?.text = cellModel.enteredtextFieldInFamilyNumber
            textFieldEnter?.delegate = self
            
            
        }
    }
 
    
    func settamwinCardModel() {
        let card1 = TamwinCardTableViewModel(strTitle: "Food Only: 10004589", cellType: .tamwinCardDropDown)
        let card2 = TamwinCardTableViewModel(strTitle: "Food Only: 10009867", cellType: .tamwinCardDropDown)
        let card3 = TamwinCardTableViewModel(strTitle: "Food Only: 10006512", cellType: .tamwinCardDropDown)
        let card4 = TamwinCardTableViewModel(strTitle: "Food Only: 10002138", cellType: .tamwinCardDropDown)
        let card5 = TamwinCardTableViewModel(strTitle: "Food Only: 10009134", cellType: .tamwinCardDropDown)
        
        tamwinCardNumberArray = [card1, card2, card3, card4, card5]
    }
    
    func setPersonalDetailItems() {
        
        labelPersonalDetailTitle?.text = cellModel.getTitle()
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        delegate?.passTextFieldInFamilyNumber(strFamilyNumber: textField.text ?? "", passModel: model)
      
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        if cellModel.cellType == .requestNumberCell {
            if textFieldEnter?.text?.isEmpty == false {
                heightInRequestNumber?.constant = 0
            }
            else {
                heightInRequestNumber?.constant = 20
            }
            print("text field in Family Number : \(textFieldEnter?.text)")
        }
        endEditing(true)
        return true;
    }

    
    @IBAction func buttonActionTamwin(sender: UIButton) {
        
        delegate?.buttonActionTamwinPass(sender: buttonTamwin)
    }
}
 
extension PersonalDetailTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tamwinCardNumberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModeltTamwin = tamwinCardNumberArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModeltTamwin.identifier, for: indexPath) as! TamwinCardNumberTableViewCell
        if cellModel.cellType == .dropDownCell {
            if cellModeltTamwin.isSelected == true {
                heightOfViewInTamwinCardNumber?.constant = 0
                buttonActionTamwin(sender: buttonTamwin)
            }
            else {
                heightOfViewInTamwinCardNumber?.constant = 113
            }
        }
        
        
        cell.cellModel = cellModeltTamwin

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellModel = tamwinCardNumberArray[indexPath.row]
       
        if cellModel.isSelected == true {
            cellModel.isSelected = false
        } else {
            cellModel.isSelected = true
        }
        
        labelInTamwinCardNumber.text = cellModel.TamwinCardDetails.title
        tableDropDown.reloadData()
        
    }
    
}
