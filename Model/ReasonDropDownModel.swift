//
//  ReasonDropDownModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 17/10/22.
//

import Foundation


class ReasonDropDownModel {
    
    var name: String = ""
    
    init(_ dict: [String: Any]) {
        self.name = dict["name"] as? String ?? ""
    }
}
