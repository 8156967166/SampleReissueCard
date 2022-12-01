//
//  CardRecipientModel.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 19/10/22.
//

import Foundation

class CardRecipientModel {
    
    var title: String = ""
    
    init(_ dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
    }
}
