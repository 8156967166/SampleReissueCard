//
//  DocumentTypeTableViewModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 17/10/22.
//

import Foundation

enum DocumentDropDownCellType {
    case documentDropDownCell
}

class DocumentDropDownTableViewModel {
    
    var identifier: String = "documentTypeDropDown.Cell"
    var cellType:DocumentDropDownCellType = .documentDropDownCell
    var documentDropDownDetails: DocumentTypeModel = DocumentTypeModel([:])
    var isSelected: Bool = false
    
    
    init(strTitle: String, cellType:DocumentDropDownCellType) {
        self.documentDropDownDetails.name = strTitle
        self.cellType = cellType
        switch cellType {
        case .documentDropDownCell:
            identifier = "documentTypeDropDown.Cell"
        }
    }
    
    func getname() -> String {
        return documentDropDownDetails.name
    }
}
