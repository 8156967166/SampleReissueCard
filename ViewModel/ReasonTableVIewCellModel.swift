//
//  ReasonTableVIewCellModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import Foundation

enum Functionalites {
    case remarkCell
    case dropDownCell
    case imageAttachmentCell
    case dropDrownDocumentCell
    case imageSizeDocCell
}

class ReasonTableViewModel {
    
    var identifier: String = "dropdownreason.Cell"
    var cellType:Functionalites = .dropDownCell
    var reasonDetails: ReasonModel = ReasonModel([:])
    var isSelected: Bool = false
    var isSelect: Bool = false
    var isSelectDoc: Bool = false
    init(strTitle: String, cellType:Functionalites) {
        self.reasonDetails.title = strTitle
        self.cellType = cellType
        switch cellType {
        case .dropDownCell:
            identifier = "dropdownreason.Cell"
        case .remarkCell:
            identifier = "remarkReson.Cell"
        case .imageAttachmentCell:
            identifier = "imageAttachment.Cell"
        case .dropDrownDocumentCell:
            identifier = "documentType.Cell"
        case .imageSizeDocCell:
            identifier = "imageSize.Cell"
        }
    }
    
    func getTitle() -> String {
        return reasonDetails.title
    }
}
