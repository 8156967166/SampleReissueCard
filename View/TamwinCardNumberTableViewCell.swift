//
//  TamwinCardNumberTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 13/10/22.
//

import UIKit

class TamwinCardNumberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInTamwinCardNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellModel: TamwinCardTableViewModel! {
        didSet {
            setTamwinCardNumberItems()
        }
    }
    
    func setTamwinCardNumberItems() {
        labelInTamwinCardNumber.text = cellModel.getTitle()
    }

}
