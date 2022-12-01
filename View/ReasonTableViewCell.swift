//
//  ReasonTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import UIKit

protocol PassDataToReasonVcDelegate {
    
    func buttonActionPassImageAttachment(sender: UIButton)
    func buttonActionReasonDropDownPass(sender: UIButton)
    func buttonActionDocumentDropDownPass(sender: UIButton)
    func heightOfImageViewPass(heightImageView: NSLayoutConstraint)
}

class ReasonTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelReasonTitle: UILabel?
    @IBOutlet weak var viewInImageAttachment: UIView!
    @IBOutlet weak var buttonImageAttachment: UIButton!
    @IBOutlet weak var imageInImageAttachment: UIImageView?
    @IBOutlet weak var viewHide: UIView?
    @IBOutlet weak var tableViewReason: UITableView!
    @IBOutlet weak var buttonSelectReason: UIButton!
    @IBOutlet weak var heightInReasonDropDownView: NSLayoutConstraint?
    @IBOutlet weak var labelSelectReason: UILabel!
    @IBOutlet weak var heightInImageAttachmentView: NSLayoutConstraint?
    @IBOutlet weak var tableViewDocument: UITableView!
    @IBOutlet weak var heightInDocumentTypeView: NSLayoutConstraint?
    @IBOutlet weak var buttonSelectDocument: UIButton!
    @IBOutlet weak var labelSelectDocument: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var cellModelInReason: ReasonTableViewModel?
    var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var reasondropDownArray = [ReasonDropDownTableViewModel]()
    var documentDropDownArray = [DocumentDropDownTableViewModel]()
    
    var delegate: PassDataToReasonVcDelegate?
    var cellModel: ReasonTableViewModel! {
        didSet {
            
            setPersonalDetailItems()
           
//            delegate?.heightOfImageViewPass(heightImageView: heightInImageAttachmentView ?? 0)
            
            if cellModel.cellType == .imageAttachmentCell {
                setRectangle()
            }
//            viewInImageAttachment?.frame.size.height = 200
            let mainString = "Reason*"
            let stringToColor = "*"
            let range = (mainString as NSString).range(of: stringToColor)

            let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

            if cellModel.reasonDetails.title == "Reason*" {
                labelReasonTitle?.attributedText = mutableAttributedString
                
            }
            
            let docString = "Document Type*"
            let stringToColors = "*"
            let ranges = (docString as NSString).range(of: stringToColors)

            let mutableAttributedStrings = NSMutableAttributedString.init(string: docString)
            mutableAttributedStrings.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: ranges)
            
            if cellModel.reasonDetails.title == "Document Type*" {
                labelReasonTitle?.attributedText = mutableAttributedStrings
            }
            if cellModel.cellType == .dropDownCell {
                setreasonDropDownModel()
            }
            if cellModel.cellType == .dropDrownDocumentCell {
                setDocumentTypeModel()
            }
            
            if cellModel.isSelect == true {
                heightInReasonDropDownView?.constant = 100
            }
            
            else {
                heightInReasonDropDownView?.constant = 0
            }
            
            if cellModel.isSelectDoc == true {
                heightInDocumentTypeView?.constant = 100
            }
            else {
                heightInDocumentTypeView?.constant = 0
            }
        }
    }
    
    func setPersonalDetailItems() {
        labelReasonTitle?.text = cellModel.getTitle()
    }
    
    func setRectangle() {
        
        let Width = viewInImageAttachment.frame.size.width //you can use triangleView.frame.size.height
        let height = viewInImageAttachment.frame.size.height
//        let heightWidth = rectangleView.frame.size.width
        
        let shape = CAShapeLayer()
        
        shape.path = roundedRectangle(Width: Width, height: height)
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 1
//        shape.position = CGPoint(x: 0, y: 0)
        shape.strokeColor = UIColor.gray.cgColor
        shape.lineDashPattern =  [7,5]
        shape.strokeColor = #colorLiteral(red: 0.621047914, green: 0.1558654606, blue: 0.2734069228, alpha: 1)
        viewInImageAttachment.layer.insertSublayer(shape, at: 0)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        endEditing(true)
        return true;
    }
    
    func roundedRectangle(Width: CGFloat, height: CGFloat) -> CGPath {

       let point1 = CGPoint(x: 1 * Width + 14, y: 0 * height)
       let point2 = CGPoint(x: 1 * Width + 14 , y: 1 * height)
       let point3 =  CGPoint(x: 0 * Width, y: 1 * height)
       let point4 =  CGPoint(x: 0 * Width , y: 0 * height)
       let path = CGMutablePath()

       path.move(to: CGPoint(x: 0 * Width, y: 0 * height))
       path.addArc(tangent1End: point1, tangent2End: point2, radius: 2)
       path.addArc(tangent1End: point2, tangent2End: point3, radius: 2)
       path.addArc(tangent1End: point3, tangent2End: point4, radius: 2)
       path.addArc(tangent1End: point4, tangent2End: point1, radius: 2)
//       path.closeSubpath()
       return path
        
    }
    
    func setreasonDropDownModel() {
        let cardLost = ReasonDropDownTableViewModel(strTitle: "Card Lost", cellType: .reasonDropDownCell)
        let damagedCard = ReasonDropDownTableViewModel(strTitle: "Damaged Card", cellType: .reasonDropDownCell)
        let nameChange = ReasonDropDownTableViewModel(strTitle: "Name Change", cellType: .reasonDropDownCell)
        let headofFamilyDeceased = ReasonDropDownTableViewModel(strTitle: "Head of Family Deceased", cellType: .reasonDropDownCell)
        
        reasondropDownArray.append(cardLost)
        reasondropDownArray.append(damagedCard)
        reasondropDownArray.append(nameChange)
        reasondropDownArray.append(headofFamilyDeceased)
       
//        tableViewReason.reloadData()
        
        
    }
    
    func setDocumentTypeModel() {
        let jpeg = DocumentDropDownTableViewModel(strTitle: "JPEG", cellType: .documentDropDownCell)
        let png = DocumentDropDownTableViewModel(strTitle: "PNG", cellType: .documentDropDownCell)
        let gif = DocumentDropDownTableViewModel(strTitle: "GIF", cellType: .documentDropDownCell)
        documentDropDownArray.append(jpeg)
        documentDropDownArray.append(png)
        documentDropDownArray.append(gif)
//        tableViewDocument.reloadData()
    }
    
    @IBAction func buttonActionImageAttachment(sender: UIButton) {
        delegate?.buttonActionPassImageAttachment(sender: buttonImageAttachment)
    }
    
    @IBAction func buttonActionSelectReasonDropDown(sender: UIButton) {
        if cellModel.cellType == .dropDownCell {
            delegate?.buttonActionReasonDropDownPass(sender: buttonSelectReason)
        }
        if cellModel.cellType == .dropDrownDocumentCell {
            delegate?.buttonActionDocumentDropDownPass(sender: buttonSelectDocument)
        }
    }
}

extension ReasonTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reasondropDownArray.count
        var returnValue = 0
        if cellModel.cellType == .dropDownCell {
            returnValue = reasondropDownArray.count
        }
        else {
            returnValue = documentDropDownArray.count
        }
        return returnValue
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cellModel.cellType == .dropDownCell {
            
            let cellModel = reasondropDownArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! ReasonDropDownTableViewCell
            
            if cellModel.isSelected == true {
                heightInReasonDropDownView?.constant = 0
            }
            else {
                heightInReasonDropDownView?.constant = 100
            }
            cell.cellModel = cellModel
            
            return cell
            
        }
        
        else {
            let cellModelInDocument = documentDropDownArray[indexPath.row]
            let cellDocument = tableView.dequeueReusableCell(withIdentifier: cellModelInDocument.identifier, for: indexPath) as! DocumentTypeTableViewCell
            
            if cellModelInDocument.isSelected == true {
                heightInDocumentTypeView?.constant = 0
            }
            else {
                heightInDocumentTypeView?.constant = 100
            }

            cellDocument.cellModelInDoc = cellModelInDocument
            return cellDocument
        }
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellModel.cellType == .dropDownCell {
            
            let cellModel = reasondropDownArray[indexPath.row]
            for model in reasondropDownArray {
                model.isSelected = false
            }
            cellModel.isSelected = true
            labelSelectReason.text = cellModel.reasonDropDownDetails.name
            buttonActionSelectReasonDropDown(sender: buttonSelectReason)
//            tableViewReason.reloadData()
            
        }
        else {
            let cellModelInDoc = documentDropDownArray[indexPath.row]
            for model in documentDropDownArray {
                model.isSelected = false
            }
            cellModelInDoc.isSelected = true
            labelSelectDocument.text = cellModelInDoc.documentDropDownDetails.name
            buttonActionSelectReasonDropDown(sender: buttonSelectDocument)
//            tableViewDocument.reloadData()
        }

    }
    
}
