//
//  TamwinCardNoDropDown.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 13/10/22.
//

import Foundation

class  TamwinCardModel {
    
    var title: String = ""
    
    init(_ dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
    }
}
