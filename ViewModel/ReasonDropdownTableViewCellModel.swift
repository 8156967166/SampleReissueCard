//
//  ReasonDropdownTableViewCellModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 17/10/22.
//

import Foundation

enum ReasonDropDownCellType {
    case reasonDropDownCell
}

class ReasonDropDownTableViewModel {
    
    var identifier: String = "reasonDropDown.cell"
    var cellType:ReasonDropDownCellType = .reasonDropDownCell
    var reasonDropDownDetails: ReasonDropDownModel = ReasonDropDownModel([:])
    var isSelected: Bool = false
    
    
    init(strTitle: String, cellType:ReasonDropDownCellType) {
        self.reasonDropDownDetails.name = strTitle
        self.cellType = cellType
        switch cellType {
        case .reasonDropDownCell:
            identifier = "reasonDropDown.cell"
        }
    }
    
    func getname() -> String {
        return reasonDropDownDetails.name
    }
}
