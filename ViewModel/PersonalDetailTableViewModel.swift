//
//  PersonalDetailTableViewModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import Foundation


enum Functionality {
    case familyNumberCell
    case requestNumberCell
    case familyTypeCell
    case dropDownCell
}


class PersonalDetailTableViewModel {
    
    var identifier: String = "PersonalDetail.Cell"
    var cellType:Functionality = .familyNumberCell
    var personalDetails: PersonalDetailModel = PersonalDetailModel([:])
    var isSelected: Bool = false
    var enteredtextFieldInFamilyNumber: String = ""
    
    init(strTitle: String, cellType:Functionality) {
        self.personalDetails.title = strTitle
        self.cellType = cellType
        switch cellType {
        case .familyNumberCell:
            identifier = "PersonalDetail.Cell"
        case .dropDownCell:
            identifier = "dropDwon.Cell"
        case .requestNumberCell:
            identifier = "PersonalDetail.Cell"
        case .familyTypeCell:
            identifier = "PersonalDetail.Cell"
        }
    }
    
    func getTitle() -> String {
        return personalDetails.title
    }
}
