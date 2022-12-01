//
//  PersonalDetail.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import Foundation

class PersonalDetailModel {
    
    var title: String = ""
    
    init(_ dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
    }
}
