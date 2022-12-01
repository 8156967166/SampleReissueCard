//
//  DeliveryModeTableViewCellModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 10/10/22.
//

import Foundation

enum CellTypes {
    case deliveryModeCell
    case requiredFeesCell
    case cardRecipientName
    case cardCell
    
}

class DeliveryModeTableViewModel {
    
    var identifier: String = "deliveryMode.Cell"
    var cellType:CellTypes = .deliveryModeCell
    var deliveryModeDetails: DeliveryModel = DeliveryModel([:])
    var isSelected: Bool = false
    
    
    init(strTitle: String, cellType:CellTypes) {
        self.deliveryModeDetails.title = strTitle
        self.cellType = cellType
        switch cellType {
        case .deliveryModeCell:
            identifier = "deliveryMode.Cell"
        case .requiredFeesCell:
            identifier = "requiredFee.Cell"
        case .cardRecipientName:
            identifier = "CardRecipientName.Cell"
        case .cardCell:
            identifier = "Card.Cell"
        }
    }
    
    func getTitle() -> String {
        return deliveryModeDetails.title
    }
}
