//
//  DeliveryMode.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 10/10/22.
//

import Foundation

class  DeliveryModel {
    
    var title: String = ""
    
    init(_ dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
    }
}
