//
//  CardRecipientTableViewCellModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 19/10/22.
//

import Foundation

enum CardRecipientCellType {
    case cardRecipientCell
}

class CardRecipientTableViewModel {
    
    var identifier: String = "cardRecipient.Cell"
    var cellType:CardRecipientCellType = .cardRecipientCell
    var cardRecipientDetails: CardRecipientModel = CardRecipientModel([:])
    var isSelected: Bool = false
    
    init(strTitle: String, cellType: CardRecipientCellType) {
        self.cardRecipientDetails.title = strTitle
        self.cellType = cellType
        switch cellType {
        case .cardRecipientCell:
            identifier = "cardRecipient.Cell"
        }
    }
    
    func gettitle() -> String {
        return cardRecipientDetails.title
    }
}
