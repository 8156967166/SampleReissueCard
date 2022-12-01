//
//  DocumentTypeTableViewCell.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 17/10/22.
//

import UIKit

class DocumentTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelDropDownInDocument: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellModelInDoc: DocumentDropDownTableViewModel! {
        didSet {
            setDocumentDropDownItems()
        }
    }
    
    func setDocumentDropDownItems() {
        labelDropDownInDocument.text = cellModelInDoc.getname()
    }
}
