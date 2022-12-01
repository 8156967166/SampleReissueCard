//
//  TamwincardtableViewCellModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 13/10/22.
//

import Foundation

enum CellType {
    case tamwinCardDropDown
}

class TamwinCardTableViewModel {
    
    var identifier: String = "TamwinCardDropDown.Cell"
    var cellType:CellType = .tamwinCardDropDown
    var TamwinCardDetails: TamwinCardModel = TamwinCardModel([:])
    var isSelected: Bool = false
    
    
    init(strTitle: String, cellType:CellType) {
        self.TamwinCardDetails.title = strTitle
        self.cellType = cellType
        switch cellType {
        case .tamwinCardDropDown:
            identifier = "TamwinCardDropDown.Cell"
        }
    }
    
    func getTitle() -> String {
        return TamwinCardDetails.title
    }
}
