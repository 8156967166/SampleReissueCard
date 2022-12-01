//
//  ReasonDropDownTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 17/10/22.
//

import UIKit

class ReasonDropDownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelDropDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellModel: ReasonDropDownTableViewModel! {
        didSet {
            setReasonDropDownItems()
        }
    }
    
    func setReasonDropDownItems() {
        labelDropDown.text = cellModel.getname()
    }
}
